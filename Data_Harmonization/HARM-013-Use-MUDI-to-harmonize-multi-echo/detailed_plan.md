# Detailed Implementation Plan: HARM-013: Use MUDI to harmonize multi-echo fMRI across sites

**Task ID:** HARM-013
**Category:** Data Harmonization

## Overview

**Objective:** Use MUDI to harmonize multi-echo fMRI across sites

**Context:** Combine information across echoes while harmonizing sites

## Data Source

**Dataset:** Custom multi-echo dataset
**Data Key:** ``

## Prerequisites

**Required Capabilities:** data_harmonization_tool; advanced_analysis_tool

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

# Note: Specific data source not specified. Use appropriate Custom multi-echo dataset data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Combine information across echoes while harmonizing sites
   - Use MUDI to harmonize multi-echo fMRI across sites

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] echoes_combined
- [ ] sites_harmonized

## Required Evidence Files

- [ ] `harmonized_multi_echo.nii.gz`
- [ ] `echo_weights.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh harmonized_multi_echo.nii.gz
   ls -lh echo_weights.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: echoes_combined
   - Verify: sites_harmonized

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
