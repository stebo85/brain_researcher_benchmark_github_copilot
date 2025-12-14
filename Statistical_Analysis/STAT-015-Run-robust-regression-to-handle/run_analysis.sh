#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# STAT-015: Run robust regression to handle outliers in Development fMRI age effects
# Fit regression model that downweights influential outliers for stable parameter estimates

echo "=========================================="
echo "STAT-015: Run robust regression to handle outliers in Development fMRI age effects"
echo "Dataset: Development fMRI dataset"
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
echo "Step 4: Running analysis for STAT-015..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for STAT-015")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Run robust regression to handle outliers in Development fMRI age effects
# - Context: Fit regression model that downweights influential outliers for stable parameter estimates
# - Data: nilearn.datasets.fetch_development_fmri
# - Expected evidence: robust_beta_map.nii.gz

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: STAT-015")
print(f"  - User Prompt: Run robust regression to handle outliers in Development fMRI age effects")
print(f"  - Context: Fit regression model that downweights influential outliers for stable parameter estimates")
print(f"  - Data Key: nilearn.datasets.fetch_development_fmri")
print(f"  - Evidence Required: robust_beta_map.nii.gz, outlier_weights.csv")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "STAT-015",
    "task_name": "Run robust regression to handle outliers in Development fMRI age effects",
    "dataset": "Development fMRI dataset",
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

if [ -f "${EVIDENCE_DIR}/robust_beta_map.nii.gz" ] || [ -d "${EVIDENCE_DIR}/robust_beta_map.nii.gz" ]; then
    echo "✓ Found: robust_beta_map.nii.gz"
else
    echo "⚠ Not found: robust_beta_map.nii.gz (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/outlier_weights.csv" ] || [ -d "${EVIDENCE_DIR}/outlier_weights.csv" ]; then
    echo "✓ Found: outlier_weights.csv"
else
    echo "⚠ Not found: outlier_weights.csv (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# STAT-015 Evidence: Run robust regression to handle outliers in Development fMRI age effects

## Task Description
Fit regression model that downweights influential outliers for stable parameter estimates

## Dataset
Development fMRI dataset

## Data Key
nilearn.datasets.fetch_development_fmri

## Evidence Files

1. **robust_beta_map.nii.gz**
2. **outlier_weights.csv**

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
echo "✓ STAT-015 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
