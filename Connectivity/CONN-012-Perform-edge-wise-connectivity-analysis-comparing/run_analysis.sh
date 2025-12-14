#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# CONN-012: Perform edge-wise connectivity analysis comparing autism vs control in ABIDE
# Test every possible connection between regions (thousands of edges) to find specific links altered in autism

echo "=========================================="
echo "CONN-012: Perform edge-wise connectivity analysis comparing autism vs control in ABIDE"
echo "Dataset: ABIDE"
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
echo "Step 4: Running analysis for CONN-012..."
python3 << 'PYEOF'
import os
import sys
from pathlib import Path
from datetime import datetime
import json

print("Starting analysis for CONN-012")
print("=" * 60)

# TODO: Implement the actual analysis based on:
# - Task: Perform edge-wise connectivity analysis comparing autism vs control in ABIDE
# - Context: Test every possible connection between regions (thousands of edges) to find specific links altered in autism
# - Data: nilearn.datasets.fetch_abide_pcp
# - Expected evidence: significant_edges.csv

# Placeholder implementation - this should be customized per task
print("\nNOTE: This is a template script.")
print("The actual analysis implementation needs to be added based on the task requirements.")
print("\nTask Requirements:")
print(f"  - Task ID: CONN-012")
print(f"  - User Prompt: Perform edge-wise connectivity analysis comparing autism vs control in ABIDE")
print(f"  - Context: Test every possible connection between regions (thousands of edges) to find specific links altered in autism")
print(f"  - Data Key: nilearn.datasets.fetch_abide_pcp")
print(f"  - Evidence Required: significant_edges.csv, edge_statistics.npy")

# Create placeholder evidence files
evidence_dir = Path("evidence")
evidence_dir.mkdir(exist_ok=True)

# Generate a summary report
summary = {
    "task_id": "CONN-012",
    "task_name": "Perform edge-wise connectivity analysis comparing autism vs control in ABIDE",
    "dataset": "ABIDE",
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

if [ -f "${EVIDENCE_DIR}/significant_edges.csv" ] || [ -d "${EVIDENCE_DIR}/significant_edges.csv" ]; then
    echo "✓ Found: significant_edges.csv"
else
    echo "⚠ Not found: significant_edges.csv (may need task-specific implementation)"
fi

if [ -f "${EVIDENCE_DIR}/edge_statistics.npy" ] || [ -d "${EVIDENCE_DIR}/edge_statistics.npy" ]; then
    echo "✓ Found: edge_statistics.npy"
else
    echo "⚠ Not found: edge_statistics.npy (may need task-specific implementation)"
fi

# Step 6: Create README for evidence
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# CONN-012 Evidence: Perform edge-wise connectivity analysis comparing autism vs control in ABIDE

## Task Description
Test every possible connection between regions (thousands of edges) to find specific links altered in autism

## Dataset
ABIDE

## Data Key
nilearn.datasets.fetch_abide_pcp

## Evidence Files

1. **significant_edges.csv**
2. **edge_statistics.npy**

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
echo "✓ CONN-012 completed!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
