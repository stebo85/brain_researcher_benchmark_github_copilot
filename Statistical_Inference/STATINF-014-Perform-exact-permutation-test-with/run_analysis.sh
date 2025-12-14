#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# STATINF-014: Perform exact permutation test with small sample correction
# Use all possible permutations for exact p-values with tiny samples

echo "=========================================="
echo "STATINF-014: Perform exact permutation test with small sample correction"
echo "Dataset: Small sample dataset (n=10)"
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
echo "Step 4: Running analysis for STATINF-014..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for STATINF-014")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Perform exact permutation test with small sample correction
# - Context: Use all possible permutations for exact p-values with tiny samples
# - Data: 
# - Expected evidence: exact_pvals.csv

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: STATINF-014")
print(f"  - User Prompt: Perform exact permutation test with small sample correction")
print(f"  - Context: Use all possible permutations for exact p-values with tiny samples")
print(f"  - Data Key: ")
print(f"  - Evidence Required: exact_pvals.csv, all_permutations.npy")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "STATINF-014",
    "task_name": "Perform exact permutation test with small sample correction",
    "dataset": "Small sample dataset (n=10)",
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

if [ -f "${EVIDENCE_DIR}/exact_pvals.csv" ] || [ -d "${EVIDENCE_DIR}/exact_pvals.csv" ]; then
    echo "✓ Found: exact_pvals.csv"
else
    echo "⚠ Not found: exact_pvals.csv (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/all_permutations.npy" ] || [ -d "${EVIDENCE_DIR}/all_permutations.npy" ]; then
    echo "✓ Found: all_permutations.npy"
else
    echo "⚠ Not found: all_permutations.npy (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# STATINF-014 Evidence: Perform exact permutation test with small sample correction

## Task Description
Use all possible permutations for exact p-values with tiny samples

## Dataset
Small sample dataset (n=10)

## Data Key


## Evidence Files

1. **exact_pvals.csv**
2. **all_permutations.npy**

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
echo "✓ STATINF-014 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
