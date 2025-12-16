# Detailed Implementation Plan: STAT-015: Run robust regression to handle outliers in Development fMRI age effects

**Task ID:** STAT-015
**Category:** Statistical Analysis

## Overview

**Objective:** Run robust regression to handle outliers in Development fMRI age effects

**Context:** Fit regression model that downweights influential outliers for stable parameter estimates

## Data Source

**Dataset:** Development fMRI dataset
**Data Key:** `nilearn.datasets.fetch_development_fmri`

## Prerequisites

**Required Capabilities:** robust_regression_tool; outlier_resistant

### Tool Installation

```bash
# Tool Setup Instructions

# Python packages
pip install nibabel nilearn scikit-learn

# Verify installation
python -c "import nibabel"  # Test Python imports
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_development_fmri(n_subjects=30)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Fit regression model that downweights influential outliers for stable parameter estimates
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

- [ ] robust_fit_complete
- [ ] weights_computed

## Required Evidence Files

- [ ] `robust_beta_map.nii.gz`
- [ ] `outlier_weights.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh robust_beta_map.nii.gz
   ls -lh outlier_weights.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: robust_fit_complete
   - Verify: weights_computed

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
