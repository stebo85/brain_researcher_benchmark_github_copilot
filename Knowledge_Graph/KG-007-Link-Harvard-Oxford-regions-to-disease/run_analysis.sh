#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# KG-007: Link Harvard-Oxford regions to disease associations from literature
# Connect brain anatomy to known clinical conditions from medical literature mining

echo "=========================================="
echo "KG-007: Link Harvard-Oxford regions to disease associations from literature"
echo "Dataset: Harvard-Oxford atlas"
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
echo "Step 4: Running analysis for KG-007..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for KG-007")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Link Harvard-Oxford regions to disease associations from literature
# - Context: Connect brain anatomy to known clinical conditions from medical literature mining
# - Data: 
# - Expected evidence: clinical_kg.json

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: KG-007")
print(f"  - User Prompt: Link Harvard-Oxford regions to disease associations from literature")
print(f"  - Context: Connect brain anatomy to known clinical conditions from medical literature mining")
print(f"  - Data Key: ")
print(f"  - Evidence Required: clinical_kg.json, disease_network.html")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "KG-007",
    "task_name": "Link Harvard-Oxford regions to disease associations from literature",
    "dataset": "Harvard-Oxford atlas",
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

if [ -f "${EVIDENCE_DIR}/clinical_kg.json" ] || [ -d "${EVIDENCE_DIR}/clinical_kg.json" ]; then
    echo "✓ Found: clinical_kg.json"
else
    echo "⚠ Not found: clinical_kg.json (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/disease_network.html" ] || [ -d "${EVIDENCE_DIR}/disease_network.html" ]; then
    echo "✓ Found: disease_network.html"
else
    echo "⚠ Not found: disease_network.html (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# KG-007 Evidence: Link Harvard-Oxford regions to disease associations from literature

## Task Description
Connect brain anatomy to known clinical conditions from medical literature mining

## Dataset
Harvard-Oxford atlas

## Data Key


## Evidence Files

1. **clinical_kg.json**
2. **disease_network.html**

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
echo "✓ KG-007 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
