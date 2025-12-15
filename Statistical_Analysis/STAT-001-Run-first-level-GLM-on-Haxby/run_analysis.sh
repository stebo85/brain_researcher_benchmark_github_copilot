#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# STAT-001: Run first-level GLM on Haxby faces vs houses with HRF convolution
# Model brain response to experimental conditions using general linear model with hemodynamic response function

echo "=========================================="
echo "STAT-001: Run first-level GLM on Haxby faces vs houses with HRF convolution"
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
echo "Step 4: Running analysis for STAT-001..."
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
from nilearn import datasets, plotting
from nilearn.glm.first_level import FirstLevelModel, make_first_level_design_matrix
from nilearn.plotting import plot_stat_map, plot_design_matrix

print("Starting analysis for STAT-001: First-Level GLM Analysis")
print("=" * 60)

# Create evidence directory
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Step 1: Load Haxby dataset
print("\nStep 1: Loading Haxby dataset...")
try:
    data = datasets.fetch_haxby()
    fmri_filename = data.func[0]
    labels_df = pd.read_csv(data.session_target[0], sep=' ')
    mask_filename = data.mask_vt[0]
    print(f"✓ Loaded Haxby dataset")
except Exception as e:
    print(f"Error loading dataset: {e}")
    sys.exit(1)

# Step 2: Prepare design matrix
print("\nStep 2: Creating GLM design matrix...")

# Get timing information
tr = 2.5  # Repetition time in seconds
n_scans = len(labels_df)
frame_times = np.arange(n_scans) * tr

# Create events dataframe for faces and houses
events = []
for idx, row in labels_df.iterrows():
    label = row['labels']
    if label in ['face', 'house']:
        events.append({
            'onset': frame_times[idx],
            'duration': tr,
            'trial_type': label
        })

events_df = pd.DataFrame(events)
print(f"✓ Created events dataframe with {len(events_df)} events")
print(f"  Faces: {np.sum(events_df['trial_type'] == 'face')}")
print(f"  Houses: {np.sum(events_df['trial_type'] == 'house')}")

# Create design matrix with HRF convolution
design_matrix = make_first_level_design_matrix(
    frame_times=frame_times,
    events=events_df,
    hrf_model='glover',  # Canonical HRF
    drift_model='cosine',
    high_pass=0.01
)

print(f"✓ Design matrix shape: {design_matrix.shape}")

# Save design matrix visualization
fig = plot_design_matrix(design_matrix)
fig.savefig(evidence_dir / "design_matrix.png", dpi=300, bbox_inches='tight')
plt.close()
print("✓ Saved design_matrix.png")

# Step 3: Fit GLM model
print("\nStep 3: Fitting first-level GLM...")
fmri_glm = FirstLevelModel(
    t_r=tr,
    mask_img=mask_filename,
    standardize=False,
    hrf_model='glover',
    drift_model='cosine',
    high_pass=0.01,
    verbose=0
)

fmri_glm.fit(fmri_filename, events=events_df)
print("✓ GLM model fitted")

# Step 4: Compute contrasts
print("\nStep 4: Computing contrasts...")

# Extract beta maps for each condition
beta_face = fmri_glm.compute_contrast('face', output_type='effect_size')
beta_house = fmri_glm.compute_contrast('house', output_type='effect_size')

# Compute faces vs houses contrast
contrast_faces_vs_houses = fmri_glm.compute_contrast('face - house', output_type='z_score')

# Save beta maps
print("✓ Saving beta maps...")
beta_face.to_filename(evidence_dir / "beta_maps.nii.gz")
print("  Saved beta_maps.nii.gz (face condition)")

# Step 5: Save z-score contrast map
contrast_faces_vs_houses.to_filename(evidence_dir / "contrast_zmap.nii.gz")
print("✓ Saved contrast_zmap.nii.gz (faces vs houses)")

# Step 6: Visualize results
print("\nStep 5: Creating visualizations...")

# Plot beta map for faces
fig, axes = plt.subplots(2, 1, figsize=(12, 10))

plotting.plot_stat_map(
    beta_face,
    bg_img=None,
    threshold=3.0,
    title='Beta Map: Face Condition',
    axes=axes[0],
    display_mode='z',
    cut_coords=5,
    colorbar=True
)

# Plot contrast map (faces vs houses)
plotting.plot_stat_map(
    contrast_faces_vs_houses,
    bg_img=None,
    threshold=2.5,
    title='Z-Score Map: Faces vs Houses',
    axes=axes[1],
    display_mode='z',
    cut_coords=5,
    colorbar=True
)

plt.tight_layout()
plt.savefig(evidence_dir / "stat_maps.png", dpi=300, bbox_inches='tight')
plt.close()
print("✓ Saved stat_maps.png")

# Step 7: Compute summary statistics
print("\nStep 6: Computing summary statistics...")

# Get z-score statistics
z_data = contrast_faces_vs_houses.get_fdata()
z_data_flat = z_data[z_data != 0]  # Exclude masked voxels

summary_stats = {
    'max_z': float(np.max(z_data_flat)),
    'min_z': float(np.min(z_data_flat)),
    'mean_z': float(np.mean(z_data_flat)),
    'std_z': float(np.std(z_data_flat)),
    'n_significant_voxels_p05': int(np.sum(np.abs(z_data_flat) > 1.96)),
    'n_significant_voxels_p01': int(np.sum(np.abs(z_data_flat) > 2.58)),
    'n_significant_voxels_p001': int(np.sum(np.abs(z_data_flat) > 3.29))
}

print(f"  Max Z-score: {summary_stats['max_z']:.3f}")
print(f"  Significant voxels (p<0.001): {summary_stats['n_significant_voxels_p001']}")

# Step 8: Generate summary report
summary = {
    "task_id": "STAT-001",
    "task_name": "Run first-level GLM on Haxby faces vs houses with HRF convolution",
    "dataset": "Haxby dataset",
    "timestamp": datetime.now().isoformat(),
    "status": "completed",
    "n_scans": int(n_scans),
    "tr": float(tr),
    "n_events": len(events_df),
    "n_faces": int(np.sum(events_df['trial_type'] == 'face')),
    "n_houses": int(np.sum(events_df['trial_type'] == 'house')),
    "hrf_model": "glover",
    "drift_model": "cosine",
    "statistics": summary_stats,
    "outputs": {
        "beta_maps": "beta_maps.nii.gz",
        "contrast_zmap": "contrast_zmap.nii.gz",
        "design_matrix_plot": "design_matrix.png",
        "stat_maps_plot": "stat_maps.png"
    }
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

if [ -f "${EVIDENCE_DIR}/beta_maps.nii.gz" ] || [ -d "${EVIDENCE_DIR}/beta_maps.nii.gz" ]; then
    echo "✓ Found: beta_maps.nii.gz"
else
    echo "⚠ Not found: beta_maps.nii.gz (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/contrast_zmap.nii.gz" ] || [ -d "${EVIDENCE_DIR}/contrast_zmap.nii.gz" ]; then
    echo "✓ Found: contrast_zmap.nii.gz"
else
    echo "⚠ Not found: contrast_zmap.nii.gz (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# STAT-001 Evidence: Run first-level GLM on Haxby faces vs houses with HRF convolution

## Task Description
Model brain response to experimental conditions using general linear model with hemodynamic response function

## Dataset
Haxby dataset

## Data Key
nilearn.datasets.fetch_haxby

## Evidence Files

1. **beta_maps.nii.gz**
2. **contrast_zmap.nii.gz**

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
echo "✓ STAT-001 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
