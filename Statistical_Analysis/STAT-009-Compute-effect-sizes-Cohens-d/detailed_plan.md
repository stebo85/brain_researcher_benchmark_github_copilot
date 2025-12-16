# Detailed Implementation Plan: STAT-009: Compute effect sizes (Cohen's d) for OASIS age-cognition correlation

**Task ID:** STAT-009
**Category:** Statistical Analysis

## Overview

**Objective:** Compute effect sizes (Cohen's d) for OASIS age-cognition correlation

**Context:** Quantify magnitude of effects beyond p-values using standardized mean differences

## Data Source

**Dataset:** OASIS VBM dataset
**Data Key:** `nilearn.datasets.fetch_oasis_vbm`

## Prerequisites

**Required Capabilities:** effect_size_tool; cohen_d

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
data = datasets.fetch_oasis_vbm(n_subjects=50)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Quantify magnitude of effects beyond p-values using standardized mean differences
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

- [ ] effect_sizes_computed
- [ ] confidence_intervals

## Required Evidence Files

- [ ] `cohens_d_map.nii.gz`
- [ ] `effect_size_stats.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh cohens_d_map.nii.gz
   ls -lh effect_size_stats.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: effect_sizes_computed
   - Verify: confidence_intervals

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
