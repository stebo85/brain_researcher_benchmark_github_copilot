# Advanced Brain Imaging Analysis Example

## Overview
This example demonstrates a more complex analysis workflow using multiple tools and custom scripts.

## Analysis Description
Perform a comprehensive check of the Neurodesk environment, validate multiple neuroimaging tool installations, and demonstrate containerized command execution.

## Requirements

**Container:** fsl  
**Command:** fsl --version

## Objectives
1. Verify CVMFS mounting and Neurodesk accessibility
2. Check multiple neuroimaging tool installations
3. Demonstrate script execution within the workflow
4. Document the available tools for future analyses

## Analysis Steps

### Step 1: Environment Validation

```bash
echo "==================================="
echo "NEURODESK ENVIRONMENT VALIDATION"
echo "==================================="
echo ""

# Check CVMFS mount
echo "1. Checking CVMFS mount point..."
if [ -d "/cvmfs/neurodesk.ardc.edu.au" ]; then
    echo "   ✓ CVMFS is mounted"
    echo "   Location: /cvmfs/neurodesk.ardc.edu.au"
else
    echo "   ✗ CVMFS is not mounted"
fi
echo ""

# List available tools
echo "2. Listing available Neurodesk tools (first 20)..."
ls -1 /cvmfs/neurodesk.ardc.edu.au 2>/dev/null | head -20 | while read tool; do
    echo "   - $tool"
done
echo ""

# System information
echo "3. System Information..."
echo "   OS: $(uname -s)"
echo "   Kernel: $(uname -r)"
echo "   Architecture: $(uname -m)"
echo "   Hostname: $(hostname)"
echo "   Date: $(date)"
echo ""

# Check for Singularity/Apptainer
echo "4. Container Runtime Check..."
if command -v apptainer &> /dev/null; then
    echo "   ✓ Apptainer found: $(apptainer --version)"
elif command -v singularity &> /dev/null; then
    echo "   ✓ Singularity found: $(singularity --version)"
else
    echo "   ✗ No container runtime found"
fi
echo ""

echo "==================================="
echo "VALIDATION COMPLETE"
echo "==================================="
```

### Step 2: Tool Discovery

Search for specific neuroimaging tools in the Neurodesk repository:

```bash
echo ""
echo "==================================="
echo "TOOL DISCOVERY"
echo "==================================="
echo ""

# Function to check for tool
check_tool() {
    local tool_name=$1
    echo "Checking for $tool_name..."
    
    if [ -d "/cvmfs/neurodesk.ardc.edu.au/$tool_name" ] || ls -d /cvmfs/neurodesk.ardc.edu.au/*${tool_name}* 2>/dev/null | head -1; then
        echo "   ✓ $tool_name is available"
        # List versions if directory exists
        ls -1 "/cvmfs/neurodesk.ardc.edu.au/$tool_name" 2>/dev/null | head -5 | while read version; do
            echo "     Version: $version"
        done
    else
        echo "   ✗ $tool_name not found"
    fi
    echo ""
}

# Check for common neuroimaging tools
check_tool "freesurfer"
check_tool "fsl"
check_tool "ants"
check_tool "afni"
check_tool "spm"
check_tool "mrtrix"

echo "==================================="
echo "DISCOVERY COMPLETE"
echo "==================================="
```

## Expected Outputs

1. **CVMFS Validation**: Confirmation that Neurodesk is accessible via CVMFS
2. **Tool Inventory**: List of available neuroimaging analysis tools
3. **System Information**: Details about the GitHub Actions runner environment
4. **Container Runtime**: Verification of Singularity/Apptainer availability
5. **Tool Versions**: Specific version information for requested tools

## Success Criteria

- [x] CVMFS mount is accessible
- [x] At least 5 neuroimaging tools are available
- [x] Container runtime (Apptainer/Singularity) is functional
- [x] FSL version command executes successfully

## Notes

- This analysis serves as a comprehensive environment check
- Use this as a template for more complex analyses
- The workflow automatically captures all output and commits it to the results directory
- Future analyses can build upon this validation to perform actual neuroimaging computations

## Next Steps

After validating the environment:
1. Add data files to analyze
2. Create specific analysis pipelines
3. Integrate with existing neuroimaging workflows
4. Automate repetitive analysis tasks

## References

- [Neurodesk Tool Documentation](https://www.neurodesk.org/docs/overview/applications/)
- [FSL User Guide](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki)
- [CVMFS Configuration Guide](https://cvmfs.readthedocs.io/en/stable/cpt-quickstart.html)
