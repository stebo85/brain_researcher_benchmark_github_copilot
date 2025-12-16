# Detailed Implementation Plan: STATINF-010: Run mixed effects ANOVA with subject as random effect

**Task ID:** STATINF-010
**Category:** Statistical Inference

## Overview

**Objective:** Run mixed effects ANOVA with subject as random effect

**Context:** Model both fixed task effects and random subject variability

## Data Source

**Dataset:** Localizer multi-task data
**Data Key:** ``

## Prerequisites

**Required Capabilities:** mixed_effects_tool

### Tool Installation

```bash
# Required tools and libraries
```

## Step 1: Data Acquisition

# Note: Specific data source not specified. Use appropriate Localizer multi-task data data.


## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Model both fixed task effects and random subject variability
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

- [ ] f_statistic_map
- [ ] random_effects_variance

## Required Evidence Files

- [ ] `anova_fmap.nii.gz`
- [ ] `variance_components.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh anova_fmap.nii.gz
   ls -lh variance_components.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: f_statistic_map
   - Verify: random_effects_variance

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
