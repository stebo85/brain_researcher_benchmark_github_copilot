#!/bin/bash

# SECURITY WARNING: This script executes code from markdown analysis files.
# Only run with trusted analysis files from verified repository collaborators.
# All analysis files should be reviewed before execution to prevent malicious code.
# The script is designed for use in controlled GitHub Actions environments.

set -e

# Check if analysis file is provided
if [ -z "$1" ]; then
    echo "Error: No analysis file provided"
    exit 1
fi

ANALYSIS_FILE="$1"

# Check if file exists
if [ ! -f "$ANALYSIS_FILE" ]; then
    echo "Error: Analysis file '$ANALYSIS_FILE' not found"
    exit 1
fi

echo "================================================"
echo "Starting Brain Imaging Analysis"
echo "Analysis file: $ANALYSIS_FILE"
echo "Timestamp: $(date -u +"%Y-%m-%d %H:%M:%S UTC")"
echo "================================================"

# Extract analysis name from filename and sanitize it
ANALYSIS_NAME=$(basename "$ANALYSIS_FILE" .md | tr -cd '[:alnum:]_-')
if [ -z "$ANALYSIS_NAME" ]; then
    echo "Error: Invalid analysis filename"
    exit 1
fi
RESULT_DIR="results/${ANALYSIS_NAME}_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$RESULT_DIR"

# Create the results markdown file
RESULT_FILE="$RESULT_DIR/results.md"

# Start the results file with metadata
cat > "$RESULT_FILE" <<EOF
# Analysis Results: $ANALYSIS_NAME

**Date:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")  
**Analysis File:** $ANALYSIS_FILE  
**CVMFS Path:** ${CVMFS_PATH:-/cvmfs/neurodesk.ardc.edu.au}

---

## Analysis Prompt

EOF

# Append the original analysis prompt
cat "$ANALYSIS_FILE" >> "$RESULT_FILE"

cat >> "$RESULT_FILE" <<EOF

---

## Execution Log

EOF

# Parse the analysis file for container and command information
echo "Parsing analysis file..."

# Check if CVMFS is available
if [ -d "${CVMFS_PATH:-/cvmfs/neurodesk.ardc.edu.au}" ]; then
    echo "CVMFS is mounted at ${CVMFS_PATH:-/cvmfs/neurodesk.ardc.edu.au}"
    echo "✓ CVMFS is available" >> "$RESULT_FILE"
    echo "" >> "$RESULT_FILE"
    
    # List available tools in Neurodesk
    echo "### Available Neurodesk Tools (first 20)" >> "$RESULT_FILE"
    echo '```' >> "$RESULT_FILE"
    ls -1 "${CVMFS_PATH:-/cvmfs/neurodesk.ardc.edu.au}" 2>&1 | head -20 >> "$RESULT_FILE" || echo "Unable to list tools" >> "$RESULT_FILE"
    echo '```' >> "$RESULT_FILE"
    echo "" >> "$RESULT_FILE"
else
    echo "Warning: CVMFS not available at ${CVMFS_PATH:-/cvmfs/neurodesk.ardc.edu.au}"
    echo "⚠ CVMFS not available - analysis may be limited" >> "$RESULT_FILE"
    echo "" >> "$RESULT_FILE"
fi

# Extract container specification from markdown
# Container names are sanitized to alphanumeric, underscore, and hyphen only
CONTAINER_RAW=$(grep -E "^\*\*Container:\*\*|^Container:" "$ANALYSIS_FILE" | sed 's/\*\*Container:\*\*//g; s/^Container://g' | xargs || echo "")
CONTAINER=$(echo "$CONTAINER_RAW" | tr -cd '[:alnum:]_-')

# Extract command - NOT sanitized by design to allow flexible command syntax
# SECURITY: Commands are executed as-is within containers. Only use trusted analysis files.
# See SECURITY.md for details on the security model.
COMMAND=$(grep -E "^\*\*Command:\*\*|^Command:" "$ANALYSIS_FILE" | sed 's/\*\*Command:\*\*//g; s/^Command://g' | sed 's/^[ \t]*//g' || echo "")

echo "### Execution Details" >> "$RESULT_FILE"
echo "" >> "$RESULT_FILE"

if [ -n "$CONTAINER" ]; then
    echo "**Requested Container:** $CONTAINER" >> "$RESULT_FILE"
    echo "" >> "$RESULT_FILE"
fi

if [ -n "$COMMAND" ]; then
    echo "**Requested Command:** \`$COMMAND\`" >> "$RESULT_FILE"
    echo "" >> "$RESULT_FILE"
fi

# Extract code blocks from markdown (these might be scripts to run)
echo "### Analysis Execution" >> "$RESULT_FILE"
echo "" >> "$RESULT_FILE"

# Check for bash/shell code blocks in the analysis file
if grep -q '```bash' "$ANALYSIS_FILE" || grep -q '```sh' "$ANALYSIS_FILE"; then
    echo "Found executable code blocks in analysis file" >> "$RESULT_FILE"
    echo "" >> "$RESULT_FILE"
    
    # Extract and execute bash/sh code blocks (both variants)
    awk '/```(bash|sh)/,/```/' "$ANALYSIS_FILE" | grep -v '```' > "$RESULT_DIR/script.sh" 2>/dev/null || true
    
    if [ -s "$RESULT_DIR/script.sh" ]; then
        echo "**Executing embedded script:**" >> "$RESULT_FILE"
        echo '```bash' >> "$RESULT_FILE"
        cat "$RESULT_DIR/script.sh" >> "$RESULT_FILE"
        echo '```' >> "$RESULT_FILE"
        echo "" >> "$RESULT_FILE"
        
        echo "**Script Output:**" >> "$RESULT_FILE"
        echo '```' >> "$RESULT_FILE"
        
        # Execute the script and capture output
        if bash "$RESULT_DIR/script.sh" >> "$RESULT_FILE" 2>&1; then
            echo '```' >> "$RESULT_FILE"
            echo "" >> "$RESULT_FILE"
            echo "✓ Script executed successfully" >> "$RESULT_FILE"
        else
            echo '```' >> "$RESULT_FILE"
            echo "" >> "$RESULT_FILE"
            echo "⚠ Script execution encountered errors" >> "$RESULT_FILE"
        fi
        echo "" >> "$RESULT_FILE"
    fi
fi

# If container and command are specified, try to execute them
if [ -n "$CONTAINER" ] && [ -n "$COMMAND" ]; then
    echo "### Container Execution" >> "$RESULT_FILE"
    echo "" >> "$RESULT_FILE"
    
    # Check if the container exists in CVMFS
    CONTAINER_PATH="${CVMFS_PATH:-/cvmfs/neurodesk.ardc.edu.au}/$CONTAINER"
    
    if [ -d "$CONTAINER_PATH" ]; then
        echo "**Container found:** $CONTAINER_PATH" >> "$RESULT_FILE"
        echo "" >> "$RESULT_FILE"
        
        # Look for singularity image files
        SINGULARITY_IMAGE=$(find "$CONTAINER_PATH" -name "*.sif" -o -name "*.simg" 2>/dev/null | head -1 || echo "")
        
        if [ -n "$SINGULARITY_IMAGE" ] && [ -f "$SINGULARITY_IMAGE" ]; then
            echo "**Singularity Image:** $SINGULARITY_IMAGE" >> "$RESULT_FILE"
            echo "" >> "$RESULT_FILE"
            echo "**Executing command in container...**" >> "$RESULT_FILE"
            echo '```' >> "$RESULT_FILE"
            
            if command -v singularity &> /dev/null || command -v apptainer &> /dev/null; then
                SING_CMD=$(command -v apptainer 2>/dev/null || command -v singularity 2>/dev/null)
                $SING_CMD exec "$SINGULARITY_IMAGE" bash -c "$COMMAND" >> "$RESULT_FILE" 2>&1 || echo "Command execution failed" >> "$RESULT_FILE"
            else
                echo "Singularity/Apptainer not available" >> "$RESULT_FILE"
            fi
            
            echo '```' >> "$RESULT_FILE"
            echo "" >> "$RESULT_FILE"
        else
            echo "No Singularity image found in container directory" >> "$RESULT_FILE"
            echo "" >> "$RESULT_FILE"
        fi
    else
        echo "Container directory not found: $CONTAINER_PATH" >> "$RESULT_FILE"
        echo "" >> "$RESULT_FILE"
    fi
fi

# Add thought process section
cat >> "$RESULT_FILE" <<EOF

---

## Thought Process and Findings

This analysis was executed autonomously by the GitHub Actions workflow.

### Environment Setup
- CVMFS mounting: $([ -d "${CVMFS_PATH:-/cvmfs/neurodesk.ardc.edu.au}" ] && echo "Successful" || echo "Failed")
- Container runtime: $(command -v apptainer &> /dev/null && echo "Apptainer available" || command -v singularity &> /dev/null && echo "Singularity available" || echo "Not available")

### Analysis Steps
1. Parsed analysis prompt from markdown file
2. Verified CVMFS and Neurodesk availability
3. Identified and prepared requested container
4. Executed analysis commands
5. Captured results and logs

### Next Steps
- Review the results above
- Verify the analysis outputs
- Iterate on the analysis if needed by updating the prompt markdown file

---

**Analysis completed at:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")
EOF

echo ""
echo "================================================"
echo "Analysis Complete"
echo "Results saved to: $RESULT_FILE"
echo "================================================"
echo ""

# Display results summary
cat "$RESULT_FILE"

exit 0
