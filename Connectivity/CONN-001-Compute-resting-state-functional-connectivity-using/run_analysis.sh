#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# CONN-001: Compute resting-state functional connectivity using MSDL atlas on ADHD dataset
# Calculate how brain regions communicate during rest using a 39-region atlas to compare ADHD vs control subjects

echo "=========================================="
echo "CONN-001: Compute resting-state functional connectivity using MSDL atlas on ADHD dataset"
echo "Dataset: ADHD-200"
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
echo "Step 4: Running analysis for CONN-001..."
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
from nilearn import datasets, connectome, plotting
from nilearn.maskers import NiftiLabelsMasker
from scipy import stats

print("Starting analysis for CONN-001: Resting-State Connectivity Analysis")
print("=" * 60)

# Create evidence directory
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Step 1: Load ADHD dataset
print("\nStep 1: Loading ADHD-200 dataset...")
try:
    adhd_data = datasets.fetch_adhd(n_subjects=30)
    print(f"✓ Loaded {len(adhd_data.func)} subjects")
except Exception as e:
    print(f"Error loading dataset: {e}")
    sys.exit(1)

# Step 2: Load MSDL atlas
print("\nStep 2: Loading MSDL atlas...")
atlas = datasets.fetch_atlas_msdl()
atlas_filename = atlas['maps']
labels = atlas['labels']
print(f"✓ Loaded MSDL atlas with {len(labels)} regions")

# Step 3: Extract time series from each subject
print("\nStep 3: Extracting time series from brain regions...")
masker = NiftiLabelsMasker(
    labels_img=atlas_filename,
    standardize=True,
    memory='nilearn_cache',
    verbose=0
)

time_series_list = []
valid_subjects = []
phenotypic = adhd_data.phenotypic
groups = []

for i, func_file in enumerate(adhd_data.func):
    try:
        time_series = masker.fit_transform(func_file)
        time_series_list.append(time_series)
        valid_subjects.append(i)
        # Get group label (0=control, 1=ADHD)
        groups.append(phenotypic[i].get('adhd', -1))
        if (i + 1) % 5 == 0:
            print(f"  Processed {i + 1}/{len(adhd_data.func)} subjects")
    except Exception as e:
        print(f"Warning: Could not process subject {i}: {e}")
        continue

print(f"✓ Extracted time series from {len(time_series_list)} subjects")

# Step 4: Compute connectivity matrices
print("\nStep 4: Computing functional connectivity matrices...")
correlation_measure = connectome.ConnectivityMeasure(kind='correlation')
connectivity_matrices = correlation_measure.fit_transform(time_series_list)

print(f"✓ Computed {len(connectivity_matrices)} connectivity matrices")
print(f"  Matrix shape: {connectivity_matrices[0].shape}")

# Step 5: Compute mean connectivity matrix
mean_connectivity = np.mean(connectivity_matrices, axis=0)

# Save mean connectivity matrix
np.save(evidence_dir / "connectivity_matrix.npy", mean_connectivity)
print("✓ Saved connectivity_matrix.npy")

# Step 6: Visualize connectivity matrix
print("\nStep 5: Visualizing connectivity matrix...")
fig, ax = plt.subplots(figsize=(12, 10))
im = ax.imshow(mean_connectivity, cmap='RdBu_r', vmin=-1, vmax=1)
ax.set_title('Mean Resting-State Functional Connectivity (MSDL Atlas)', fontsize=14)
ax.set_xlabel('Brain Regions', fontsize=12)
ax.set_ylabel('Brain Regions', fontsize=12)
plt.colorbar(im, ax=ax, label='Correlation')
plt.tight_layout()
plt.savefig(evidence_dir / "connectivity_matrix.png", dpi=300, bbox_inches='tight')
plt.close()
print("✓ Saved connectivity_matrix.png")

# Step 7: Group comparison (ADHD vs Controls)
print("\nStep 6: Performing group comparison...")
groups = np.array(groups)
adhd_mask = groups == 1
control_mask = groups == 0

if np.sum(adhd_mask) > 0 and np.sum(control_mask) > 0:
    adhd_conn = connectivity_matrices[adhd_mask]
    control_conn = connectivity_matrices[control_mask]
    
    print(f"  ADHD subjects: {np.sum(adhd_mask)}")
    print(f"  Control subjects: {np.sum(control_mask)}")
    
    # Compute mean connectivity for each group
    mean_adhd = np.mean(adhd_conn, axis=0)
    mean_control = np.mean(control_conn, axis=0)
    
    # Statistical comparison (t-test for each connection)
    n_regions = mean_connectivity.shape[0]
    group_differences = []
    
    for i in range(n_regions):
        for j in range(i + 1, n_regions):
            adhd_vals = adhd_conn[:, i, j]
            control_vals = control_conn[:, i, j]
            t_stat, p_val = stats.ttest_ind(adhd_vals, control_vals)
            
            if p_val < 0.05:  # Significant differences
                group_differences.append({
                    'region_i': labels[i],
                    'region_j': labels[j],
                    'adhd_mean': float(np.mean(adhd_vals)),
                    'control_mean': float(np.mean(control_vals)),
                    'difference': float(np.mean(adhd_vals) - np.mean(control_vals)),
                    't_statistic': float(t_stat),
                    'p_value': float(p_val)
                })
    
    # Save group comparison results
    if group_differences:
        comparison_df = pd.DataFrame(group_differences)
        comparison_df = comparison_df.sort_values('p_value')
        comparison_df.to_csv(evidence_dir / "group_comparison.csv", index=False)
        print(f"✓ Saved group_comparison.csv ({len(group_differences)} significant differences)")
    else:
        print("  No significant group differences found at p < 0.05")
        pd.DataFrame({'note': ['No significant differences found']}).to_csv(
            evidence_dir / "group_comparison.csv", index=False
        )
else:
    print("  Insufficient group data for comparison")
    pd.DataFrame({'note': ['Insufficient data for group comparison']}).to_csv(
        evidence_dir / "group_comparison.csv", index=False
    )

# Step 8: Generate summary report
summary = {
    "task_id": "CONN-001",
    "task_name": "Compute resting-state functional connectivity using MSDL atlas on ADHD dataset",
    "dataset": "ADHD-200",
    "timestamp": datetime.now().isoformat(),
    "status": "completed",
    "n_subjects": len(time_series_list),
    "n_adhd": int(np.sum(adhd_mask)) if np.sum(adhd_mask) > 0 else 0,
    "n_control": int(np.sum(control_mask)) if np.sum(control_mask) > 0 else 0,
    "n_regions": len(labels),
    "atlas": "MSDL (39 regions)",
    "connectivity_measure": "Pearson correlation",
    "mean_connectivity_range": [float(mean_connectivity.min()), float(mean_connectivity.max())],
    "n_significant_differences": len(group_differences) if 'group_differences' in locals() else 0
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

if [ -f "${EVIDENCE_DIR}/connectivity_matrix.npy" ] || [ -d "${EVIDENCE_DIR}/connectivity_matrix.npy" ]; then
    echo "✓ Found: connectivity_matrix.npy"
else
    echo "⚠ Not found: connectivity_matrix.npy (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/group_comparison.csv" ] || [ -d "${EVIDENCE_DIR}/group_comparison.csv" ]; then
    echo "✓ Found: group_comparison.csv"
else
    echo "⚠ Not found: group_comparison.csv (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# CONN-001 Evidence: Compute resting-state functional connectivity using MSDL atlas on ADHD dataset

## Task Description
Calculate how brain regions communicate during rest using a 39-region atlas to compare ADHD vs control subjects

## Dataset
ADHD-200

## Data Key
nilearn.datasets.fetch_adhd

## Evidence Files

1. **connectivity_matrix.npy**
2. **group_comparison.csv**

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
echo "✓ CONN-001 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
