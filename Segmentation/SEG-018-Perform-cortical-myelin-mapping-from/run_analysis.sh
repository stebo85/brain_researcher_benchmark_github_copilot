#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# SEG-018: Perform cortical myelin mapping from T1w/T2w ratio images
# Create myelin content maps showing cortical myeloarchitecture from intensity ratios

echo "=========================================="
echo "SEG-018: Perform cortical myelin mapping from T1w/T2w ratio images"
echo "Dataset: HCP-style data"
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
echo "Step 4: Running analysis for SEG-018..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for SEG-018")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Perform cortical myelin mapping from T1w/T2w ratio images
# - Context: Create myelin content maps showing cortical myeloarchitecture from intensity ratios
# - Data: 
# - Expected evidence: myelin_map.nii.gz

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: SEG-018")
print(f"  - User Prompt: Perform cortical myelin mapping from T1w/T2w ratio images")
print(f"  - Context: Create myelin content maps showing cortical myeloarchitecture from intensity ratios")
print(f"  - Data Key: ")
print(f"  - Evidence Required: myelin_map.nii.gz, myelin_profile.png")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "SEG-018",
    "task_name": "Perform cortical myelin mapping from T1w/T2w ratio images",
    "dataset": "HCP-style data",
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

if [ -f "${EVIDENCE_DIR}/myelin_map.nii.gz" ] || [ -d "${EVIDENCE_DIR}/myelin_map.nii.gz" ]; then
    echo "✓ Found: myelin_map.nii.gz"
else
    echo "⚠ Not found: myelin_map.nii.gz (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/myelin_profile.png" ] || [ -d "${EVIDENCE_DIR}/myelin_profile.png" ]; then
    echo "✓ Found: myelin_profile.png"
else
    echo "⚠ Not found: myelin_profile.png (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# SEG-018 Evidence: Perform cortical myelin mapping from T1w/T2w ratio images

## Task Description
Create myelin content maps showing cortical myeloarchitecture from intensity ratios

## Dataset
HCP-style data

## Data Key


## Evidence Files

1. **myelin_map.nii.gz**
2. **myelin_profile.png**

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
echo "✓ SEG-018 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
