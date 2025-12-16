# Detailed Implementation Plan: STATINF-015: Apply voxel-wise FWE correction using max statistic

**Task ID:** STATINF-015
**Category:** Statistical Inference

## Overview

**Objective:** Apply voxel-wise FWE correction using max statistic

**Context:** Control family-wise error by comparing to distribution of maximum statistics

## Data Source

**Dataset:** Localizer contrasts
**Data Key:** ``

## Prerequisites

**Required Capabilities:** multiple_comparison_tool

### Tool Installation

```bash
# Tool Setup Instructions

# Install required tools based on task requirements
# Use 'ml av' to see available Neurodesk modules
# Use 'pip install <package>' for Python packages

# Verify installation
```

## Step 1: Data Acquisition

# Note: Specific data source not specified. Use appropriate Localizer contrasts data.


## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Control family-wise error by comparing to distribution of maximum statistics
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

- [ ] max_stat_threshold
- [ ] fwe_alpha=0.05

## Required Evidence Files

- [ ] `fwe_corrected.nii.gz`
- [ ] `max_distribution.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh fwe_corrected.nii.gz
   ls -lh max_distribution.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: max_stat_threshold
   - Verify: fwe_alpha=0.05

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
