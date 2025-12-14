#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# KG-013: Extract lesion-deficit knowledge graph from clinical cases
# Link damaged brain areas to specific cognitive/motor impairments they cause

echo "=========================================="
echo "KG-013: Extract lesion-deficit knowledge graph from clinical cases"
echo "Dataset: Simulated lesion dataset"
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
echo "Step 4: Running analysis for KG-013..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for KG-013")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Extract lesion-deficit knowledge graph from clinical cases
# - Context: Link damaged brain areas to specific cognitive/motor impairments they cause
# - Data: 
# - Expected evidence: lesion_kg.json

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: KG-013")
print(f"  - User Prompt: Extract lesion-deficit knowledge graph from clinical cases")
print(f"  - Context: Link damaged brain areas to specific cognitive/motor impairments they cause")
print(f"  - Data Key: ")
print(f"  - Evidence Required: lesion_kg.json, deficit_network.html")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "KG-013",
    "task_name": "Extract lesion-deficit knowledge graph from clinical cases",
    "dataset": "Simulated lesion dataset",
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

if [ -f "${EVIDENCE_DIR}/lesion_kg.json" ] || [ -d "${EVIDENCE_DIR}/lesion_kg.json" ]; then
    echo "✓ Found: lesion_kg.json"
else
    echo "⚠ Not found: lesion_kg.json (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/deficit_network.html" ] || [ -d "${EVIDENCE_DIR}/deficit_network.html" ]; then
    echo "✓ Found: deficit_network.html"
else
    echo "⚠ Not found: deficit_network.html (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# KG-013 Evidence: Extract lesion-deficit knowledge graph from clinical cases

## Task Description
Link damaged brain areas to specific cognitive/motor impairments they cause

## Dataset
Simulated lesion dataset

## Data Key


## Evidence Files

1. **lesion_kg.json**
2. **deficit_network.html**

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
echo "✓ KG-013 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
