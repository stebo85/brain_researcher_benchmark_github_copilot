# Detailed Implementation Plan: META-019: Run subgroup meta-analysis comparing clinical vs healthy populations

**Task ID:** META-019
**Category:** Meta-Analysis

## Overview

**Objective:** Run subgroup meta-analysis comparing clinical vs healthy populations

**Context:** Test if brain activation differs between patient and control groups across studies

## Data Source

**Dataset:** Mixed population coordinates
**Data Key:** ``

## Prerequisites

**Required Capabilities:** coordinate_meta_analysis_tool

### Tool Installation

```bash
# Required tools and libraries
```

## Step 1: Data Acquisition

# Note: Specific data source not specified. Use appropriate Mixed population coordinates data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Test if brain activation differs between patient and control groups across studies
   - Run subgroup meta-analysis comparing clinical vs healthy populations

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] subgroup_contrast
- [ ] interaction_test

## Required Evidence Files

- [ ] `subgroup_difference.nii.gz`
- [ ] `subgroup_table.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh subgroup_difference.nii.gz
   ls -lh subgroup_table.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: subgroup_contrast
   - Verify: interaction_test

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
