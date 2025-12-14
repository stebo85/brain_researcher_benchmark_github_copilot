#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# WORK-008: Run quality control workflow: MRIQC on all subjects, flag outliers, generate report
# Automated QC pipeline with outlier detection across multiple subjects

echo "=========================================="
echo "WORK-008: Run quality control workflow: MRIQC on all subjects, flag outliers, generate report"
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
echo "Step 4: Running analysis for WORK-008..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for WORK-008")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Run quality control workflow: MRIQC on all subjects, flag outliers, generate report
# - Context: Automated QC pipeline with outlier detection across multiple subjects
# - Data: nilearn.datasets.fetch_adhd
# - Expected evidence: mriqc_group.html

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: WORK-008")
print(f"  - User Prompt: Run quality control workflow: MRIQC on all subjects, flag outliers, generate report")
print(f"  - Context: Automated QC pipeline with outlier detection across multiple subjects")
print(f"  - Data Key: nilearn.datasets.fetch_adhd")
print(f"  - Evidence Required: mriqc_group.html, outliers.txt")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "WORK-008",
    "task_name": "Run quality control workflow: MRIQC on all subjects, flag outliers, generate report",
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

if [ -f "${EVIDENCE_DIR}/mriqc_group.html" ] || [ -d "${EVIDENCE_DIR}/mriqc_group.html" ]; then
    echo "✓ Found: mriqc_group.html"
else
    echo "⚠ Not found: mriqc_group.html (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/outliers.txt" ] || [ -d "${EVIDENCE_DIR}/outliers.txt" ]; then
    echo "✓ Found: outliers.txt"
else
    echo "⚠ Not found: outliers.txt (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# WORK-008 Evidence: Run quality control workflow: MRIQC on all subjects, flag outliers, generate report

## Task Description
Automated QC pipeline with outlier detection across multiple subjects

## Dataset
ADHD-200 dataset

## Data Key
nilearn.datasets.fetch_adhd

## Evidence Files

1. **mriqc_group.html**
2. **outliers.txt**

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
echo "✓ WORK-008 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
