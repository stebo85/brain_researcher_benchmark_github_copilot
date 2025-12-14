#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# ELEC-020: Extract peak latencies and amplitudes from evoked components (N100, P200)
# Identify timing and magnitude of major evoked response peaks to characterize neural processing speed

echo "=========================================="
echo "ELEC-020: Extract peak latencies and amplitudes from evoked components (N100, P200)"
echo "Dataset: MNE sample dataset"
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
echo "Step 4: Running analysis for ELEC-020..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for ELEC-020")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Extract peak latencies and amplitudes from evoked components (N100, P200)
# - Context: Identify timing and magnitude of major evoked response peaks to characterize neural processing speed
# - Data: mne.datasets.sample.data_path()
# - Expected evidence: peak_latencies.csv

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: ELEC-020")
print(f"  - User Prompt: Extract peak latencies and amplitudes from evoked components (N100, P200)")
print(f"  - Context: Identify timing and magnitude of major evoked response peaks to characterize neural processing speed")
print(f"  - Data Key: mne.datasets.sample.data_path()")
print(f"  - Evidence Required: peak_latencies.csv, evoked_waveforms.png")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "ELEC-020",
    "task_name": "Extract peak latencies and amplitudes from evoked components (N100, P200)",
    "dataset": "MNE sample dataset",
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

if [ -f "${EVIDENCE_DIR}/peak_latencies.csv" ] || [ -d "${EVIDENCE_DIR}/peak_latencies.csv" ]; then
    echo "✓ Found: peak_latencies.csv"
else
    echo "⚠ Not found: peak_latencies.csv (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/evoked_waveforms.png" ] || [ -d "${EVIDENCE_DIR}/evoked_waveforms.png" ]; then
    echo "✓ Found: evoked_waveforms.png"
else
    echo "⚠ Not found: evoked_waveforms.png (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# ELEC-020 Evidence: Extract peak latencies and amplitudes from evoked components (N100, P200)

## Task Description
Identify timing and magnitude of major evoked response peaks to characterize neural processing speed

## Dataset
MNE sample dataset

## Data Key
mne.datasets.sample.data_path()

## Evidence Files

1. **peak_latencies.csv**
2. **evoked_waveforms.png**

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
echo "✓ ELEC-020 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
