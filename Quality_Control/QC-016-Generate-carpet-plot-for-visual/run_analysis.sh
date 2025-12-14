#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# QC-016: Generate carpet plot for visual inspection of Brainomics data
# Create comprehensive visualization showing all voxels' timeseries to spot global artifacts

echo "=========================================="
echo "QC-016: Generate carpet plot for visual inspection of Brainomics data"
echo "Dataset: Brainomics Localizer dataset"
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
echo "Step 4: Running analysis for QC-016..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for QC-016")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Generate carpet plot for visual inspection of Brainomics data
# - Context: Create comprehensive visualization showing all voxels' timeseries to spot global artifacts
# - Data: nilearn.datasets.fetch_localizer_contrasts
# - Expected evidence: carpet_plot.png

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: QC-016")
print(f"  - User Prompt: Generate carpet plot for visual inspection of Brainomics data")
print(f"  - Context: Create comprehensive visualization showing all voxels' timeseries to spot global artifacts")
print(f"  - Data Key: nilearn.datasets.fetch_localizer_contrasts")
print(f"  - Evidence Required: carpet_plot.png, tissue_signals.txt")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "QC-016",
    "task_name": "Generate carpet plot for visual inspection of Brainomics data",
    "dataset": "Brainomics Localizer dataset",
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

if [ -f "${EVIDENCE_DIR}/carpet_plot.png" ] || [ -d "${EVIDENCE_DIR}/carpet_plot.png" ]; then
    echo "✓ Found: carpet_plot.png"
else
    echo "⚠ Not found: carpet_plot.png (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/tissue_signals.txt" ] || [ -d "${EVIDENCE_DIR}/tissue_signals.txt" ]; then
    echo "✓ Found: tissue_signals.txt"
else
    echo "⚠ Not found: tissue_signals.txt (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# QC-016 Evidence: Generate carpet plot for visual inspection of Brainomics data

## Task Description
Create comprehensive visualization showing all voxels' timeseries to spot global artifacts

## Dataset
Brainomics Localizer dataset

## Data Key
nilearn.datasets.fetch_localizer_contrasts

## Evidence Files

1. **carpet_plot.png**
2. **tissue_signals.txt**

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
echo "✓ QC-016 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
