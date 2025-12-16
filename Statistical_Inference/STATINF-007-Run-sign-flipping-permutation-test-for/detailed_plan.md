# Detailed Implementation Plan: STATINF-007: Run sign-flipping permutation test for paired t-test

**Task ID:** STATINF-007
**Category:** Statistical Inference

## Overview

**Objective:** Run sign-flipping permutation test for paired t-test

**Context:** Test within-subject changes using sign-flipping instead of full permutation

## Data Source

**Dataset:** Pre-post intervention data
**Data Key:** ``

## Prerequisites

**Required Capabilities:** permutation_testing_tool

### Tool Installation

```bash
# Tool Setup Instructions

# Install required tools based on task requirements
# Use 'ml av' to see available Neurodesk modules
# Use 'pip install <package>' for Python packages

# Verify installation
```

## Step 1: Data Acquisition

# Note: Specific data source not specified. Use appropriate Pre-post intervention data data.


## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Test within-subject changes using sign-flipping instead of full permutation
   - Define design matrix and contrasts

3. **Perform statistical analysis**
   - Fit the model to data
   - Compute test statistics
   - Apply multiple comparison corrections

4. **Generate statistical maps**
   - Create thresholded maps
   - Identify significant clusters

5. **Save statistical results**
   - Export statistical maps
   - Save cluster information and statistics

## Acceptance Criteria

- [ ] sign_flips=10000
- [ ] exact_p_values

## Required Evidence Files

- [ ] `sign_flip_results.csv`
- [ ] `null_distribution.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh sign_flip_results.csv
   ls -lh null_distribution.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: sign_flips=10000
   - Verify: exact_p_values

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
