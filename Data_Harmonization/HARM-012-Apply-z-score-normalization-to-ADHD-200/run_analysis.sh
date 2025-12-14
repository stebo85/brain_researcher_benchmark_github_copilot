#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# HARM-012: Apply z-score normalization to ADHD-200 within-scanner batches
# Standardize signal intensity within each scanner separately

echo "=========================================="
echo "HARM-012: Apply z-score normalization to ADHD-200 within-scanner batches"
echo "Dataset: ADHD-200 dataset"
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
echo "Step 4: Running analysis for HARM-012..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for HARM-012")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Apply z-score normalization to ADHD-200 within-scanner batches
# - Context: Standardize signal intensity within each scanner separately
# - Data: nilearn.datasets.fetch_adhd
# - Expected evidence: normalized_data.npy

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: HARM-012")
print(f"  - User Prompt: Apply z-score normalization to ADHD-200 within-scanner batches")
print(f"  - Context: Standardize signal intensity within each scanner separately")
print(f"  - Data Key: nilearn.datasets.fetch_adhd")
print(f"  - Evidence Required: normalized_data.npy, normalization_params.json")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "HARM-012",
    "task_name": "Apply z-score normalization to ADHD-200 within-scanner batches",
    "dataset": "ADHD-200 dataset",
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

if [ -f "${EVIDENCE_DIR}/normalized_data.npy" ] || [ -d "${EVIDENCE_DIR}/normalized_data.npy" ]; then
    echo "✓ Found: normalized_data.npy"
else
    echo "⚠ Not found: normalized_data.npy (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/normalization_params.json" ] || [ -d "${EVIDENCE_DIR}/normalization_params.json" ]; then
    echo "✓ Found: normalization_params.json"
else
    echo "⚠ Not found: normalization_params.json (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# HARM-012 Evidence: Apply z-score normalization to ADHD-200 within-scanner batches

## Task Description
Standardize signal intensity within each scanner separately

## Dataset
ADHD-200 dataset

## Data Key
nilearn.datasets.fetch_adhd

## Evidence Files

1. **normalized_data.npy**
2. **normalization_params.json**

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
echo "✓ HARM-012 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
