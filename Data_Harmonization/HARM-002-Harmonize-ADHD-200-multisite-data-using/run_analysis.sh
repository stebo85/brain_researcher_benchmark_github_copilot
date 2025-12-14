#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# HARM-002: Harmonize ADHD-200 multisite data using Traveling Subject method
# Use traveling subjects to model and remove site-specific biases

echo "=========================================="
echo "HARM-002: Harmonize ADHD-200 multisite data using Traveling Subject method"
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
echo "Step 4: Running analysis for HARM-002..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for HARM-002")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Harmonize ADHD-200 multisite data using Traveling Subject method
# - Context: Use traveling subjects to model and remove site-specific biases
# - Data: nilearn.datasets.fetch_adhd
# - Expected evidence: harmonized_subjects/

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: HARM-002")
print(f"  - User Prompt: Harmonize ADHD-200 multisite data using Traveling Subject method")
print(f"  - Context: Use traveling subjects to model and remove site-specific biases")
print(f"  - Data Key: nilearn.datasets.fetch_adhd")
print(f"  - Evidence Required: harmonized_subjects/, validation_metrics.json")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "HARM-002",
    "task_name": "Harmonize ADHD-200 multisite data using Traveling Subject method",
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

if [ -f "${EVIDENCE_DIR}/harmonized_subjects/" ] || [ -d "${EVIDENCE_DIR}/harmonized_subjects/" ]; then
    echo "✓ Found: harmonized_subjects/"
else
    echo "⚠ Not found: harmonized_subjects/ (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/validation_metrics.json" ] || [ -d "${EVIDENCE_DIR}/validation_metrics.json" ]; then
    echo "✓ Found: validation_metrics.json"
else
    echo "⚠ Not found: validation_metrics.json (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# HARM-002 Evidence: Harmonize ADHD-200 multisite data using Traveling Subject method

## Task Description
Use traveling subjects to model and remove site-specific biases

## Dataset
ADHD-200 dataset

## Data Key
nilearn.datasets.fetch_adhd

## Evidence Files

1. **harmonized_subjects/**
2. **validation_metrics.json**

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
echo "✓ HARM-002 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
