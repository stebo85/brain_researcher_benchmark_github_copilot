# Detailed Implementation Plan: SURF-019: Create CIFTI dscalar files combining cortical and subcortical data

**Task ID:** SURF-019
**Category:** Surface

## Overview

**Objective:** Create CIFTI dscalar files combining cortical and subcortical data

**Context:** Merge surface-based cortical data with subcortical volumetric data in CIFTI format

## Data Source

**Dataset:** HCP surfaces + volumes
**Data Key:** ``

## Prerequisites

**Required Capabilities:** cifti_creation_tool; hcp_workbench

### Tool Installation

```bash
# Required tools and libraries
```

## Step 1: Data Acquisition

# Note: Specific data source not specified. Use appropriate HCP surfaces + volumes data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Merge surface-based cortical data with subcortical volumetric data in CIFTI format
   - {user_prompt}

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] cifti_generated
- [ ] grayordinates_91282

## Required Evidence Files

- [ ] `combined.dscalar.nii`
- [ ] `cifti_plot.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh combined.dscalar.nii
   ls -lh cifti_plot.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: cifti_generated
   - Verify: grayordinates_91282

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
