# Detailed Implementation Plan: STATINF-018: Calculate heterogeneity in multi-site data using I²

**Task ID:** STATINF-018
**Category:** Statistical Inference

## Overview

**Objective:** Calculate heterogeneity in multi-site data using I²

**Context:** Quantify between-site variability to decide on fixed vs random effects

## Data Source

**Dataset:** ABIDE multi-site
**Data Key:** ``

## Prerequisites

**Required Capabilities:** statistical_inference_tool

### Tool Installation

```bash
# Tool Setup Instructions

# Install required tools based on task requirements
# Use 'ml av' to see available Neurodesk modules
# Use 'pip install <package>' for Python packages

# Verify installation
```

## Step 1: Data Acquisition

# Note: Specific data source not specified. Use appropriate ABIDE multi-site data.


## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Quantify between-site variability to decide on fixed vs random effects
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

- [ ] heterogeneity_i2
- [ ] site_effects

## Required Evidence Files

- [ ] `site_heterogeneity.csv`
- [ ] `i2_by_region.nii.gz`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh site_heterogeneity.csv
   ls -lh i2_by_region.nii.gz
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: heterogeneity_i2
   - Verify: site_effects

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
