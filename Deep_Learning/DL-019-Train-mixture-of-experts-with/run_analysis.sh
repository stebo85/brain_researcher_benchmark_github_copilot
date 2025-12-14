#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# DL-019: Train mixture of experts with gating network for multi-dataset learning
# Route different datasets through specialized expert networks with learned gating

echo "=========================================="
echo "DL-019: Train mixture of experts with gating network for multi-dataset learning"
echo "Dataset: ADHD-200 + ABIDE"
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
echo "Step 4: Running analysis for DL-019..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for DL-019")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Train mixture of experts with gating network for multi-dataset learning
# - Context: Route different datasets through specialized expert networks with learned gating
# - Data: 
# - Expected evidence: moe_model.pth

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: DL-019")
print(f"  - User Prompt: Train mixture of experts with gating network for multi-dataset learning")
print(f"  - Context: Route different datasets through specialized expert networks with learned gating")
print(f"  - Data Key: ")
print(f"  - Evidence Required: moe_model.pth, expert_assignments.csv")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "DL-019",
    "task_name": "Train mixture of experts with gating network for multi-dataset learning",
    "dataset": "ADHD-200 + ABIDE",
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

if [ -f "${EVIDENCE_DIR}/moe_model.pth" ] || [ -d "${EVIDENCE_DIR}/moe_model.pth" ]; then
    echo "✓ Found: moe_model.pth"
else
    echo "⚠ Not found: moe_model.pth (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/expert_assignments.csv" ] || [ -d "${EVIDENCE_DIR}/expert_assignments.csv" ]; then
    echo "✓ Found: expert_assignments.csv"
else
    echo "⚠ Not found: expert_assignments.csv (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# DL-019 Evidence: Train mixture of experts with gating network for multi-dataset learning

## Task Description
Route different datasets through specialized expert networks with learned gating

## Dataset
ADHD-200 + ABIDE

## Data Key


## Evidence Files

1. **moe_model.pth**
2. **expert_assignments.csv**

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
echo "✓ DL-019 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
