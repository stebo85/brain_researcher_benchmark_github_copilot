#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# SIM-009: Simulate task-based fMRI with parametric modulation
# Model brain responses with amplitude varying by task difficulty

echo "=========================================="
echo "SIM-009: Simulate task-based fMRI with parametric modulation"
echo "Dataset: Event timing design"
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
echo "Step 4: Running analysis for SIM-009..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for SIM-009")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Simulate task-based fMRI with parametric modulation
# - Context: Model brain responses with amplitude varying by task difficulty
# - Data: 
# - Expected evidence: simulated_task_fmri.nii.gz

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: SIM-009")
print(f"  - User Prompt: Simulate task-based fMRI with parametric modulation")
print(f"  - Context: Model brain responses with amplitude varying by task difficulty")
print(f"  - Data Key: ")
print(f"  - Evidence Required: simulated_task_fmri.nii.gz, modulator_betas.npy")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "SIM-009",
    "task_name": "Simulate task-based fMRI with parametric modulation",
    "dataset": "Event timing design",
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

if [ -f "${EVIDENCE_DIR}/simulated_task_fmri.nii.gz" ] || [ -d "${EVIDENCE_DIR}/simulated_task_fmri.nii.gz" ]; then
    echo "✓ Found: simulated_task_fmri.nii.gz"
else
    echo "⚠ Not found: simulated_task_fmri.nii.gz (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/modulator_betas.npy" ] || [ -d "${EVIDENCE_DIR}/modulator_betas.npy" ]; then
    echo "✓ Found: modulator_betas.npy"
else
    echo "⚠ Not found: modulator_betas.npy (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# SIM-009 Evidence: Simulate task-based fMRI with parametric modulation

## Task Description
Model brain responses with amplitude varying by task difficulty

## Dataset
Event timing design

## Data Key


## Evidence Files

1. **simulated_task_fmri.nii.gz**
2. **modulator_betas.npy**

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
echo "✓ SIM-009 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
