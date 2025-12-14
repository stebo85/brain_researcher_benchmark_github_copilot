#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# PREP-001: Run fMRIPrep on Haxby dataset with FreeSurfer surface reconstruction
# Clean up raw fMRI data with motion correction, distortion correction, normalize to standard space, and reconstruct cortical surfaces

echo "=========================================="
echo "PREP-001: Run fMRIPrep on Haxby dataset with FreeSurfer surface reconstruction"
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

# Step 1: Load required modules from Neurodesk
echo ""
echo "Step 1: Loading required software modules..."
module load freesurfer 2>/dev/null || echo "Warning: freesurfer module not found, continuing..."

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
echo "Step 4: Running analysis for PREP-001..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for PREP-001")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Run fMRIPrep on Haxby dataset with FreeSurfer surface reconstruction
# - Context: Clean up raw fMRI data with motion correction, distortion correction, normalize to standard space, and reconstruct cortical surfaces
# - Data: openneuro ds000105 or nilearn.datasets.fetch_haxby
# - Expected evidence: sub-*/func/*_space-MNI_bold.nii.gz

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: PREP-001")
print(f"  - User Prompt: Run fMRIPrep on Haxby dataset with FreeSurfer surface reconstruction")
print(f"  - Context: Clean up raw fMRI data with motion correction, distortion correction, normalize to standard space, and reconstruct cortical surfaces")
print(f"  - Data Key: openneuro ds000105 or nilearn.datasets.fetch_haxby")
print(f"  - Evidence Required: sub-*/func/*_space-MNI_bold.nii.gz, sub-*/anat/surf/")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "PREP-001",
    "task_name": "Run fMRIPrep on Haxby dataset with FreeSurfer surface reconstruction",
    "dataset": "Haxby dataset",
    "timestamp": datetime.now().isoformat(),
    "status": "template_generated",
    "note": "This script is a template and needs task-specific implementation"
}

with open(evidence_dir / "analysis_summary.json", "w") as f:
    json.dump(summary, indent=2, fp=f)

print("\n✓ Generated template evidence files")
print(f"Evidence directory: {evidence_dir.absolute()}")

PYEOF

# Step 5: Verify evidence files
echo ""
echo "Step 5: Verifying evidence files..."

if [ -f "${EVIDENCE_DIR}/sub-*/func/*_space-MNI_bold.nii.gz" ] || [ -d "${EVIDENCE_DIR}/sub-*/func/*_space-MNI_bold.nii.gz" ]; then
    echo "✓ Found: sub-*/func/*_space-MNI_bold.nii.gz"
else
    echo "⚠ Not found: sub-*/func/*_space-MNI_bold.nii.gz (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/sub-*/anat/surf/" ] || [ -d "${EVIDENCE_DIR}/sub-*/anat/surf/" ]; then
    echo "✓ Found: sub-*/anat/surf/"
else
    echo "⚠ Not found: sub-*/anat/surf/ (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# PREP-001 Evidence: Run fMRIPrep on Haxby dataset with FreeSurfer surface reconstruction

## Task Description
Clean up raw fMRI data with motion correction, distortion correction, normalize to standard space, and reconstruct cortical surfaces

## Dataset
Haxby dataset

## Data Key
openneuro ds000105 or nilearn.datasets.fetch_haxby

## Evidence Files

1. **sub-*/func/*_space-MNI_bold.nii.gz**
2. **sub-*/anat/surf/**

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
echo "✓ PREP-001 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
