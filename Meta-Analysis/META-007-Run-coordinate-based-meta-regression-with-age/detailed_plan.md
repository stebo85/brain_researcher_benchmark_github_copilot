# Detailed Implementation Plan: META-007: Run coordinate-based meta-regression with age as moderator

**Task ID:** META-007
**Category:** Meta-Analysis

## Overview

**Objective:** Run coordinate-based meta-regression with age as moderator

**Context:** Test if brain activation patterns change systematically with participant age across studies

## Data Source

**Dataset:** Age-stratified coordinates
**Data Key:** ``

## Prerequisites

**Required Capabilities:** coordinate_meta_analysis_tool

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

# Note: Specific data source not specified. Use appropriate Age-stratified coordinates data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Test if brain activation patterns change systematically with participant age across studies
   - Run coordinate-based meta-regression with age as moderator

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] meta_regression_betas
- [ ] age_effect_p<0.05

## Required Evidence Files

- [ ] `age_moderation_map.nii.gz`
- [ ] `regression_results.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh age_moderation_map.nii.gz
   ls -lh regression_results.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: meta_regression_betas
   - Verify: age_effect_p<0.05

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
