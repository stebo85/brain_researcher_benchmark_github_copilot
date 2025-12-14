# Example Brain Imaging Analysis

## Overview
This is an example analysis prompt that demonstrates how to request brain imaging analyses using Neurodesk containers.

## Analysis Description
Perform a simple FreeSurfer version check and basic environment validation to demonstrate the Neurodesk container integration.

## Requirements

**Container:** freesurfer  
**Command:** freesurfer --version

## Expected Outputs
- FreeSurfer version information
- Verification that the Neurodesk container environment is properly configured
- Validation that CVMFS mounting is working correctly

## Analysis Steps

The following steps will be executed:

```bash
echo "=== Neurodesk Environment Check ==="
echo "Checking CVMFS mount..."
ls -la /cvmfs/neurodesk.ardc.edu.au/ 2>/dev/null || echo "CVMFS not mounted"

echo ""
echo "Checking for available neuroimaging tools..."
ls /cvmfs/neurodesk.ardc.edu.au/ 2>/dev/null | head -10 || echo "Unable to list tools"

echo ""
echo "Current directory: $(pwd)"
echo "Date: $(date)"
echo "Hostname: $(hostname)"
```

## Notes
- This is a minimal example to validate the workflow
- Modify this file to add your own analysis requirements
- The workflow will automatically detect changes to markdown files in the analyses/ directory
- Results will be committed back to the repository in the results/ directory

## References
- [Neurodesk Documentation](https://www.neurodesk.org/)
- [FreeSurfer Documentation](https://surfer.nmr.mgh.harvard.edu/)
