#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# ML-001: Train SVM classifier to decode object categories from Haxby VT cortex
# Use support vector machine to learn patterns that distinguish faces, houses, cats, etc from brain activity

echo "=========================================="
echo "ML-001: Train SVM classifier to decode object categories from Haxby VT cortex"
echo "Dataset: Haxby dataset"
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
echo "Step 4: Running analysis for ML-001..."
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
from nilearn import datasets
from nilearn.maskers import NiftiMasker
from sklearn.svm import SVC
from sklearn.model_selection import cross_val_score, cross_val_predict, StratifiedKFold
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay, accuracy_score, classification_report

print("Starting analysis for ML-001: Haxby Object Decoding with SVM")
print("=" * 60)

# Create evidence directory
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Step 1: Load Haxby dataset
print("\nStep 1: Loading Haxby dataset...")
try:
    data = datasets.fetch_haxby()
    func_filename = data.func[0]
    mask_filename = data.mask_vt[0]  # Ventral temporal mask
    labels_df = pd.read_csv(data.session_target[0], sep=' ')
    print(f"✓ Loaded Haxby dataset")
except Exception as e:
    print(f"Error loading dataset: {e}")
    sys.exit(1)

# Step 2: Extract features from VT cortex
print("\nStep 2: Extracting features from ventral temporal cortex...")
masker = NiftiMasker(mask_img=mask_filename, standardize=True, memory='nilearn_cache', verbose=0)
X = masker.fit_transform(func_filename)
y = labels_df['labels'].values

# Remove rest condition
condition_mask = y != 'rest'
X = X[condition_mask]
y = y[condition_mask]

print(f"✓ Feature matrix shape: {X.shape}")
print(f"✓ Number of categories: {len(np.unique(y))}")
print(f"  Categories: {', '.join(np.unique(y))}")

# Step 3: Train SVM classifier with cross-validation
print("\nStep 3: Training SVM classifier...")
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Use linear SVM for interpretability
clf = SVC(kernel='linear', C=1.0, random_state=42)
cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)

# Get cross-validation scores and predictions
cv_scores = cross_val_score(clf, X_scaled, y, cv=cv, scoring='accuracy', n_jobs=-1)

print(f"✓ Cross-validation accuracy: {cv_scores.mean():.3f} ± {cv_scores.std():.3f}")

# Get cross-validated predictions for confusion matrix (more realistic than training data)
y_pred_cv = cross_val_predict(clf, X_scaled, y, cv=cv, n_jobs=-1)
cv_acc = accuracy_score(y, y_pred_cv)

print(f"✓ Cross-validation prediction accuracy: {cv_acc:.3f}")
print("\nClassification Report (from CV predictions):")
print(classification_report(y, y_pred_cv))

# Train final model on all data for reference
clf.fit(X_scaled, y)

# Step 4: Save CV scores
print("\nStep 4: Saving cross-validation scores...")
cv_df = pd.DataFrame({
    'fold': range(1, len(cv_scores) + 1),
    'accuracy': cv_scores
})
cv_df.to_csv(evidence_dir / "cv_scores.csv", index=False)
print("✓ Saved cv_scores.csv")

# Step 5: Generate confusion matrix (using CV predictions, not training predictions)
print("\nStep 5: Generating confusion matrix...")
categories = np.unique(y)
cm = confusion_matrix(y, y_pred_cv, labels=categories)

fig, ax = plt.subplots(figsize=(12, 10))
disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=categories)
disp.plot(ax=ax, cmap='Blues', values_format='d', xticks_rotation=45)
plt.title('SVM Multi-Category Decoding: Haxby Object Recognition\n(Cross-Validation Predictions)', fontsize=14)
plt.tight_layout()
plt.savefig(evidence_dir / "confusion_matrix.png", dpi=300, bbox_inches='tight')
plt.close()
print("✓ Saved confusion_matrix.png")

# Step 6: Save per-category accuracy (using CV predictions)
print("\nStep 6: Computing per-category performance...")
category_accuracies = {}
for cat in categories:
    mask = y == cat
    if np.sum(mask) > 0:
        cat_acc = accuracy_score(y[mask], y_pred_cv[mask])
        category_accuracies[cat] = float(cat_acc)

category_df = pd.DataFrame([
    {'category': cat, 'accuracy': acc}
    for cat, acc in category_accuracies.items()
])
category_df = category_df.sort_values('accuracy', ascending=False)
category_df.to_csv(evidence_dir / "category_accuracies.csv", index=False)
print("✓ Saved category_accuracies.csv")

# Step 7: Generate summary report
summary = {
    "task_id": "ML-001",
    "task_name": "Train SVM classifier to decode object categories from Haxby VT cortex",
    "dataset": "Haxby dataset",
    "timestamp": datetime.now().isoformat(),
    "status": "completed",
    "n_samples": int(X.shape[0]),
    "n_features": int(X.shape[1]),
    "n_categories": int(len(categories)),
    "categories": list(categories),
    "metrics": {
        "cv_accuracy_mean": float(cv_scores.mean()),
        "cv_accuracy_std": float(cv_scores.std()),
        "cv_prediction_accuracy": float(cv_acc),
        "cv_scores": [float(s) for s in cv_scores]
    },
    "acceptance_criteria": {
        "cv_accuracy_threshold": 0.7,
        "cv_accuracy_passed": float(cv_scores.mean()) > 0.7
    },
    "model": {
        "type": "SVC",
        "kernel": "linear",
        "C": 1.0
    },
    "region": "Ventral Temporal Cortex",
    "note": "Confusion matrix and category accuracies based on cross-validated predictions, not training data"
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

if [ -f "${EVIDENCE_DIR}/cv_scores.csv" ] || [ -d "${EVIDENCE_DIR}/cv_scores.csv" ]; then
    echo "✓ Found: cv_scores.csv"
else
    echo "⚠ Not found: cv_scores.csv (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/confusion_matrix.png" ] || [ -d "${EVIDENCE_DIR}/confusion_matrix.png" ]; then
    echo "✓ Found: confusion_matrix.png"
else
    echo "⚠ Not found: confusion_matrix.png (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# ML-001 Evidence: Train SVM classifier to decode object categories from Haxby VT cortex

## Task Description
Use support vector machine to learn patterns that distinguish faces, houses, cats, etc from brain activity

## Dataset
Haxby dataset

## Data Key
nilearn.datasets.fetch_haxby

## Evidence Files

1. **cv_scores.csv**
2. **confusion_matrix.png**

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
echo "✓ ML-001 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
