#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# SURF-006: Compute curvature, sulcal depth, and surface area for morphometry analysis
# Extract geometric properties of cortical surface to characterize folding patterns

echo "=========================================="
echo "SURF-006: Compute curvature, sulcal depth, and surface area for morphometry analysis"
echo "Dataset: FreeSurfer surfaces"
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

# Step 1: Load required modules from Neurodesk
echo ""
echo "Step 1: Loading required software modules..."
module load freesurfer 2>/dev/null || echo "Warning: freesurfer module not found, continuing..."

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
echo "Step 4: Running analysis for SURF-006..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for SURF-006")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Compute curvature, sulcal depth, and surface area for morphometry analysis
# - Context: Extract geometric properties of cortical surface to characterize folding patterns
# - Data: 
# - Expected evidence: lh.curv

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: SURF-006")
print(f"  - User Prompt: Compute curvature, sulcal depth, and surface area for morphometry analysis")
print(f"  - Context: Extract geometric properties of cortical surface to characterize folding patterns")
print(f"  - Data Key: ")
print(f"  - Evidence Required: lh.curv, lh.sulc, lh.area, morphometry.csv")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "SURF-006",
    "task_name": "Compute curvature, sulcal depth, and surface area for morphometry analysis",
    "dataset": "FreeSurfer surfaces",
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

if [ -f "${EVIDENCE_DIR}/lh.curv" ] || [ -d "${EVIDENCE_DIR}/lh.curv" ]; then
    echo "✓ Found: lh.curv"
else
    echo "⚠ Not found: lh.curv (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/lh.sulc" ] || [ -d "${EVIDENCE_DIR}/lh.sulc" ]; then
    echo "✓ Found: lh.sulc"
else
    echo "⚠ Not found: lh.sulc (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/lh.area" ] || [ -d "${EVIDENCE_DIR}/lh.area" ]; then
    echo "✓ Found: lh.area"
else
    echo "⚠ Not found: lh.area (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/morphometry.csv" ] || [ -d "${EVIDENCE_DIR}/morphometry.csv" ]; then
    echo "✓ Found: morphometry.csv"
else
    echo "⚠ Not found: morphometry.csv (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# SURF-006 Evidence: Compute curvature, sulcal depth, and surface area for morphometry analysis

## Task Description
Extract geometric properties of cortical surface to characterize folding patterns

## Dataset
FreeSurfer surfaces

## Data Key


## Evidence Files

1. **lh.curv**
2. **lh.sulc**
3. **lh.area**
4. **morphometry.csv**

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
echo "✓ SURF-006 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
