# Detailed Implementation Plan: META-018: Perform permutation-based thresholding for meta-analytic maps

**Task ID:** META-018
**Category:** Meta-Analysis

## Overview

**Objective:** Perform permutation-based thresholding for meta-analytic maps

**Context:** Use non-parametric stats to threshold meta-analysis at family-wise error rate

## Data Source

**Dataset:** Combined ALE map
**Data Key:** ``

## Prerequisites

**Required Capabilities:** permutation_testing_tool

### Tool Installation and Setup

This analysis requires the following tools:

#### Required Tools

The specific tools needed are listed in the **Required Capabilities** section above.

```bash
# Search for available tools in Neurodesk
ml av  # List all available modules
ml av <toolname>  # Search for specific tool

# Load required tools
module load <toolname>/<version>

# Install Python packages if needed
pip install <package-name>
```

#### Environment Verification

```bash
# Verify all tools are accessible

# Check system resources
free -h  # Check available memory
df -h .  # Check available disk space
```

## Step 1: Data Acquisition

# Note: Specific data source not specified. Use appropriate Combined ALE map data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Use non-parametric stats to threshold meta-analysis at family-wise error rate
   - Perform permutation-based thresholding for meta-analytic maps

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] fwe_threshold
- [ ] permutation_n=10000

## Required Evidence Files

- [ ] `fwe_corrected_ale.nii.gz`
- [ ] `null_distribution.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh fwe_corrected_ale.nii.gz
   ls -lh null_distribution.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: fwe_threshold
   - Verify: permutation_n=10000

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
