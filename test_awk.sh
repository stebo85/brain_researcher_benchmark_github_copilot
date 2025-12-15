#!/bin/bash
prompt_file="Clinical_Analysis/CLIN-003-Predict-cognitive-decline-from-OASIS/prompt.md"
echo "Testing awk on $prompt_file"
awk '/^## Evidence Required/{flag=1; next} /^##/{flag=0} flag && NF {print; exit}' "$prompt_file"
