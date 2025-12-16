# Detailed Implementation Plan: STATINF-005: Calculate confidence intervals for ROI effect sizes in ADHD data

**Task ID:** STATINF-005
**Category:** Statistical Inference

## Overview

**Objective:** Calculate confidence intervals for ROI effect sizes in ADHD data

**Context:** Estimate precision of group differences with bootstrap confidence intervals

## Data Source

**Dataset:** ADHD-200 dataset
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** statistical_inference_tool

### Tool Installation

```bash
# Required tools and libraries
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_adhd(n_subjects=30)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Estimate precision of group differences with bootstrap confidence intervals
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

- [ ] ci_95_computed
- [ ] effect_sizes_with_ci

## Required Evidence Files

- [ ] `effect_sizes.csv`
- [ ] `ci_plot.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh effect_sizes.csv
   ls -lh ci_plot.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: ci_95_computed
   - Verify: effect_sizes_with_ci

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
