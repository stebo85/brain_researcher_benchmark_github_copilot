# Detailed Implementation Plan: STAT-020: Apply PALM accelerated permutation testing on OASIS age effects

**Task ID:** STAT-020
**Category:** Statistical Analysis

## Overview

**Objective:** Apply PALM accelerated permutation testing on OASIS age effects

**Context:** Run fast permutation inference preserving exchangeability blocks for complex designs

## Data Source

**Dataset:** OASIS VBM dataset
**Data Key:** `nilearn.datasets.fetch_oasis_vbm`

## Prerequisites

**Required Capabilities:** fsl_palm_tool; permutation

### Tool Installation

```bash
# Required tools and libraries
# FSL: Ensure FSL is installed
# export FSLDIR=/usr/local/fsl
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
   - Run fast permutation inference preserving exchangeability blocks for complex designs
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

- [ ] palm_complete
- [ ] corrected_pvalues

## Required Evidence Files

- [ ] `palm_tstat_fwep.nii.gz`
- [ ] `palm_log.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh palm_tstat_fwep.nii.gz
   ls -lh palm_log.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: palm_complete
   - Verify: corrected_pvalues

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
