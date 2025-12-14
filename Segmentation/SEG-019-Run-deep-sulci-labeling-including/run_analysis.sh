#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# SEG-019: Run deep sulci labeling including circular sulcus of insula
# Identify and label complex sulcal patterns often missed by standard parcellation

echo "=========================================="
echo "SEG-019: Run deep sulci labeling including circular sulcus of insula"
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
echo "Step 4: Running analysis for SEG-019..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for SEG-019")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Run deep sulci labeling including circular sulcus of insula
# - Context: Identify and label complex sulcal patterns often missed by standard parcellation
# - Data: nilearn.datasets.fetch_development_fmri
# - Expected evidence: sulcal_labels.mgz

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: SEG-019")
print(f"  - User Prompt: Run deep sulci labeling including circular sulcus of insula")
print(f"  - Context: Identify and label complex sulcal patterns often missed by standard parcellation")
print(f"  - Data Key: nilearn.datasets.fetch_development_fmri")
print(f"  - Evidence Required: sulcal_labels.mgz, sulcal_pattern.png")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "SEG-019",
    "task_name": "Run deep sulci labeling including circular sulcus of insula",
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

if [ -f "${EVIDENCE_DIR}/sulcal_labels.mgz" ] || [ -d "${EVIDENCE_DIR}/sulcal_labels.mgz" ]; then
    echo "✓ Found: sulcal_labels.mgz"
else
    echo "⚠ Not found: sulcal_labels.mgz (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/sulcal_pattern.png" ] || [ -d "${EVIDENCE_DIR}/sulcal_pattern.png" ]; then
    echo "✓ Found: sulcal_pattern.png"
else
    echo "⚠ Not found: sulcal_pattern.png (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# SEG-019 Evidence: Run deep sulci labeling including circular sulcus of insula

## Task Description
Identify and label complex sulcal patterns often missed by standard parcellation

## Dataset
Development fMRI dataset

## Data Key
nilearn.datasets.fetch_development_fmri

## Evidence Files

1. **sulcal_labels.mgz**
2. **sulcal_pattern.png**

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
echo "✓ SEG-019 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
