#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# CLIN-012: Classify mild cognitive impairment vs Alzheimer's from OASIS
# Distinguish early cognitive decline from dementia using brain atrophy patterns

echo "=========================================="
echo "CLIN-012: Classify mild cognitive impairment vs Alzheimer's from OASIS"
echo "Dataset: OASIS VBM dataset"
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
echo "Step 4: Running analysis for CLIN-012..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for CLIN-012")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Classify mild cognitive impairment vs Alzheimer's from OASIS
# - Context: Distinguish early cognitive decline from dementia using brain atrophy patterns
# - Data: nilearn.datasets.fetch_oasis_vbm
# - Expected evidence: mci_classifier.pkl

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: CLIN-012")
print(f"  - User Prompt: Classify mild cognitive impairment vs Alzheimer's from OASIS")
print(f"  - Context: Distinguish early cognitive decline from dementia using brain atrophy patterns")
print(f"  - Data Key: nilearn.datasets.fetch_oasis_vbm")
print(f"  - Evidence Required: mci_classifier.pkl, roc_curves.png")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "CLIN-012",
    "task_name": "Classify mild cognitive impairment vs Alzheimer's from OASIS",
    "dataset": "OASIS VBM dataset",
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

if [ -f "${EVIDENCE_DIR}/mci_classifier.pkl" ] || [ -d "${EVIDENCE_DIR}/mci_classifier.pkl" ]; then
    echo "✓ Found: mci_classifier.pkl"
else
    echo "⚠ Not found: mci_classifier.pkl (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/roc_curves.png" ] || [ -d "${EVIDENCE_DIR}/roc_curves.png" ]; then
    echo "✓ Found: roc_curves.png"
else
    echo "⚠ Not found: roc_curves.png (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# CLIN-012 Evidence: Classify mild cognitive impairment vs Alzheimer's from OASIS

## Task Description
Distinguish early cognitive decline from dementia using brain atrophy patterns

## Dataset
OASIS VBM dataset

## Data Key
nilearn.datasets.fetch_oasis_vbm

## Evidence Files

1. **mci_classifier.pkl**
2. **roc_curves.png**

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
echo "✓ CLIN-012 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
