#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# DIFF-001: Preprocess DWI data with eddy current and motion correction
# Clean up diffusion scans by correcting distortions from eddy currents and subject head movement

echo "=========================================="
echo "DIFF-001: Preprocess DWI data with eddy current and motion correction"
echo "Dataset: Custom DWI BIDS"
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
module load fsl 2>/dev/null || echo "Warning: fsl module not found, continuing..."

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
echo "Step 4: Running analysis for DIFF-001..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for DIFF-001")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Preprocess DWI data with eddy current and motion correction
# - Context: Clean up diffusion scans by correcting distortions from eddy currents and subject head movement
# - Data: 
# - Expected evidence: corrected_dwi.nii.gz

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: DIFF-001")
print(f"  - User Prompt: Preprocess DWI data with eddy current and motion correction")
print(f"  - Context: Clean up diffusion scans by correcting distortions from eddy currents and subject head movement")
print(f"  - Data Key: ")
print(f"  - Evidence Required: corrected_dwi.nii.gz, eddy_movement.txt")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "DIFF-001",
    "task_name": "Preprocess DWI data with eddy current and motion correction",
    "dataset": "Custom DWI BIDS",
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

if [ -f "${EVIDENCE_DIR}/corrected_dwi.nii.gz" ] || [ -d "${EVIDENCE_DIR}/corrected_dwi.nii.gz" ]; then
    echo "✓ Found: corrected_dwi.nii.gz"
else
    echo "⚠ Not found: corrected_dwi.nii.gz (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/eddy_movement.txt" ] || [ -d "${EVIDENCE_DIR}/eddy_movement.txt" ]; then
    echo "✓ Found: eddy_movement.txt"
else
    echo "⚠ Not found: eddy_movement.txt (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# DIFF-001 Evidence: Preprocess DWI data with eddy current and motion correction

## Task Description
Clean up diffusion scans by correcting distortions from eddy currents and subject head movement

## Dataset
Custom DWI BIDS

## Data Key


## Evidence Files

1. **corrected_dwi.nii.gz**
2. **eddy_movement.txt**

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
echo "✓ DIFF-001 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
