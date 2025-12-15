#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# CLIN-001: Classify ADHD vs controls using resting-state connectivity features
# Build diagnostic classifier from brain network patterns to aid clinical assessment

echo "=========================================="
echo "CLIN-001: Classify ADHD vs controls using resting-state connectivity features"
echo "Dataset: ADHD-200 dataset"
echo "=========================================="

# Get the absolute path of the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set analysis root for venv placement using absolute path
ANALYSIS_DIR="${SCRIPT_DIR}"

# Create output directory for evidence
EVIDENCE_DIR="${ANALYSIS_DIR}/evidence"
mkdir -p "${EVIDENCE_DIR}"

# Step 0: Configure Git if not already configured
echo ""
echo "Step 0: Configuring Git..."
GIT_USER_NAME=$(git config --global user.name 2>/dev/null || echo "")
GIT_USER_EMAIL=$(git config --global user.email 2>/dev/null || echo "")

if [ -z "$GIT_USER_NAME" ]; then
    git config --global user.name "Analysis Runner"
    echo "Set git user.name to 'Analysis Runner'"
else
    echo "Git user.name already set to: $GIT_USER_NAME"
fi

if [ -z "$GIT_USER_EMAIL" ]; then
    git config --global user.email "runner@analysis.local"
    echo "Set git user.email to 'runner@analysis.local'"
else
    echo "Git user.email already set to: $GIT_USER_EMAIL"
fi

# Step 2: Create and activate per-analysis Python virtual environment
echo ""
echo "Step 2: Setting up per-analysis Python virtual environment..."
VENV_DIR="${ANALYSIS_DIR}/.venv"
python3 -m venv "${VENV_DIR}"
. "${VENV_DIR}/bin/activate"
python -m pip install --upgrade pip

# Step 3: Install required Python packages
echo ""
echo "Step 3: Installing required Python packages..."
python -m pip install nilearn pandas numpy scikit-learn matplotlib

# Step 4: Run the analysis
echo ""
echo "Step 4: Running analysis for CLIN-001..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json
import warnings
warnings.filterwarnings('ignore')

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from nilearn import datasets, connectome
from nilearn.maskers import NiftiLabelsMasker
from sklearn.model_selection import StratifiedKFold, cross_val_score
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import (
    roc_curve, auc, confusion_matrix, balanced_accuracy_score,
    classification_report, ConfusionMatrixDisplay
)

print("Starting analysis for CLIN-001: ADHD Classification")
print("=" * 60)

# Create evidence directory
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Step 1: Load ADHD dataset
print("\nStep 1: Loading ADHD-200 dataset...")
try:
    adhd_data = datasets.fetch_adhd(n_subjects=40)
    print(f"✓ Loaded {len(adhd_data.func)} subjects")
except Exception as e:
    print(f"Error loading dataset: {e}")
    sys.exit(1)

# Step 2: Extract phenotypic information
print("\nStep 2: Processing phenotypic data...")
phenotypic = adhd_data.phenotypic
labels = []
valid_subjects = []

for i, pheno in enumerate(phenotypic):
    if pheno['adhd'] in [0, 1]:  # 0=control, 1=ADHD
        labels.append(pheno['adhd'])
        valid_subjects.append(i)

labels = np.array(labels)
print(f"✓ Valid subjects: {len(valid_subjects)}")
print(f"  Controls: {np.sum(labels == 0)}, ADHD: {np.sum(labels == 1)}")

# Step 3: Extract connectivity features using MSDL atlas
print("\nStep 3: Computing functional connectivity matrices...")
atlas = datasets.fetch_atlas_msdl()
masker = NiftiLabelsMasker(
    labels_img=atlas['maps'],
    standardize=True,
    memory='nilearn_cache',
    verbose=0
)

connectivity_matrices = []
correlation_measure = connectome.ConnectivityMeasure(kind='correlation')

for idx in valid_subjects:
    try:
        time_series = masker.fit_transform(adhd_data.func[idx])
        connectivity_matrices.append(time_series)
    except Exception as e:
        print(f"Warning: Could not process subject {idx}: {e}")

# Compute correlation matrices
print("Computing correlation matrices...")
correlation_matrices = correlation_measure.fit_transform(connectivity_matrices)

# Vectorize connectivity matrices (upper triangle)
n_subjects = len(correlation_matrices)
n_features = (correlation_matrices.shape[1] * (correlation_matrices.shape[1] - 1)) // 2
X = np.zeros((n_subjects, n_features))

for i, matrix in enumerate(correlation_matrices):
    X[i] = matrix[np.triu_indices_from(matrix, k=1)]

print(f"✓ Feature matrix shape: {X.shape}")

# Step 4: Train classifier with cross-validation
print("\nStep 4: Training Random Forest classifier...")
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

clf = RandomForestClassifier(n_estimators=100, max_depth=10, random_state=42, n_jobs=-1)

# Cross-validation
cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)
cv_scores = cross_val_score(clf, X_scaled, labels, cv=cv, scoring='balanced_accuracy')

print(f"✓ Cross-validation balanced accuracy: {cv_scores.mean():.3f} ± {cv_scores.std():.3f}")

# Train final model on all data
clf.fit(X_scaled, labels)
y_pred = clf.predict(X_scaled)
y_pred_proba = clf.predict_proba(X_scaled)[:, 1]

# Step 5: Compute metrics
print("\nStep 5: Computing performance metrics...")
bal_acc = balanced_accuracy_score(labels, y_pred)
fpr, tpr, _ = roc_curve(labels, y_pred_proba)
roc_auc = auc(fpr, tpr)

print(f"✓ Balanced Accuracy: {bal_acc:.3f}")
print(f"✓ AUC-ROC: {roc_auc:.3f}")
print("\nClassification Report:")
print(classification_report(labels, y_pred, target_names=['Control', 'ADHD']))

# Step 6: Generate ROC curve
print("\nStep 6: Generating visualizations...")
plt.figure(figsize=(8, 6))
plt.plot(fpr, tpr, color='darkorange', lw=2, label=f'ROC curve (AUC = {roc_auc:.3f})')
plt.plot([0, 1], [0, 1], color='navy', lw=2, linestyle='--', label='Chance')
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel('False Positive Rate', fontsize=12)
plt.ylabel('True Positive Rate', fontsize=12)
plt.title('ROC Curve: ADHD vs Control Classification', fontsize=14)
plt.legend(loc="lower right")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig(evidence_dir / "roc_curve.png", dpi=300, bbox_inches='tight')
plt.close()
print("✓ Saved roc_curve.png")

# Step 7: Generate confusion matrix
cm = confusion_matrix(labels, y_pred)
disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=['Control', 'ADHD'])
fig, ax = plt.subplots(figsize=(8, 6))
disp.plot(ax=ax, cmap='Blues', values_format='d')
plt.title('Confusion Matrix: ADHD Classification', fontsize=14)
plt.tight_layout()
plt.savefig(evidence_dir / "confusion_matrix.png", dpi=300, bbox_inches='tight')
plt.close()
print("✓ Saved confusion_matrix.png")

# Step 8: Save feature importance
feature_importance = clf.feature_importances_
top_n = 50
top_indices = np.argsort(feature_importance)[-top_n:][::-1]

feature_df = pd.DataFrame({
    'feature_index': top_indices,
    'importance': feature_importance[top_indices]
})
feature_df.to_csv(evidence_dir / "feature_importance.csv", index=False)
print(f"✓ Saved feature_importance.csv (top {top_n} features)")

# Step 9: Generate summary report
summary = {
    "task_id": "CLIN-001",
    "task_name": "Classify ADHD vs controls using resting-state connectivity features",
    "dataset": "ADHD-200 dataset",
    "timestamp": datetime.now().isoformat(),
    "status": "completed",
    "n_subjects": len(valid_subjects),
    "n_controls": int(np.sum(labels == 0)),
    "n_adhd": int(np.sum(labels == 1)),
    "n_features": int(n_features),
    "metrics": {
        "balanced_accuracy": float(bal_acc),
        "roc_auc": float(roc_auc),
        "cv_balanced_accuracy_mean": float(cv_scores.mean()),
        "cv_balanced_accuracy_std": float(cv_scores.std())
    },
    "acceptance_criteria": {
        "balanced_accuracy_threshold": 0.65,
        "auc_threshold": 0.7,
        "balanced_accuracy_passed": bal_acc > 0.65,
        "auc_passed": roc_auc > 0.7
    },
    "model": {
        "type": "RandomForestClassifier",
        "n_estimators": 100,
        "max_depth": 10
    },
    "atlas": "MSDL (39 regions)"
}

with open(evidence_dir / "analysis_summary.json", "w") as f:
    json.dump(summary, indent=2, fp=f)

print("\n" + "=" * 60)
print("Analysis completed successfully!")
print(f"Evidence saved to: {evidence_dir.absolute()}")
print("=" * 60)

PYEOF

# Step 5: Verify evidence files
echo ""
echo "Step 5: Verifying evidence files..."

if [ -f "${EVIDENCE_DIR}/roc_curve.png" ] || [ -d "${EVIDENCE_DIR}/roc_curve.png" ]; then
    echo "✓ Found: roc_curve.png"
else
    echo "⚠ Not found: roc_curve.png (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/confusion_matrix.png" ] || [ -d "${EVIDENCE_DIR}/confusion_matrix.png" ]; then
    echo "✓ Found: confusion_matrix.png"
else
    echo "⚠ Not found: confusion_matrix.png (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/feature_importance.csv" ] || [ -d "${EVIDENCE_DIR}/feature_importance.csv" ]; then
    echo "✓ Found: feature_importance.csv"
else
    echo "⚠ Not found: feature_importance.csv (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# CLIN-001 Evidence: Classify ADHD vs controls using resting-state connectivity features

## Task Description
Build diagnostic classifier from brain network patterns to aid clinical assessment

## Dataset
ADHD-200 dataset

## Data Key
nilearn.datasets.fetch_adhd

## Evidence Files

1. **roc_curve.png**
2. **confusion_matrix.png**
3. **feature_importance.csv**

## Analysis Summary

See `analysis_summary.json` for detailed results.

## Timestamp

Analysis run: $(date -Iseconds)
EOF

echo "✓ Created evidence README.md"

# Deactivate venv
deactivate || true

echo ""
echo "=========================================="
echo "Analysis Summary"
echo "=========================================="
cat "${EVIDENCE_DIR}/analysis_summary.json" 2>/dev/null || echo "Summary file not generated"

echo ""
echo "=========================================="
echo "Evidence files:"
ls -lh "${EVIDENCE_DIR}/" 2>/dev/null || echo "Evidence directory empty"
echo "=========================================="

echo ""
echo "✓ CLIN-001 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
