#!/bin/bash
set -e

# DATA-001: Fetch and validate BIDS structure for Haxby dataset

echo "Starting analysis for DATA-001..."

# 1. Environment Setup
echo "Setting up virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "Installing required tools..."
pip install nilearn pandas openneuro-py bids-validator

# 2. Execute Analysis
echo "Running analysis..."
python fetch_and_validate.py

# 3. Verify Output
if [ -f "validation_report.txt" ]; then
    echo "Analysis complete. Validation report generated."
    cat validation_report.txt
else
    echo "Error: Validation report not found."
    exit 1
fi
