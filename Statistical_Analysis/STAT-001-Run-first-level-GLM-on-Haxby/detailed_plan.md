# Detailed Implementation Plan: STAT-001: Run first-level GLM on Haxby faces vs houses with HRF convolution

**Task ID:** STAT-001
**Category:** Statistical Analysis

## Overview

**Objective:** Run first-level GLM on Haxby faces vs houses with HRF convolution

**Context:** Model brain response to experimental conditions using general linear model with hemodynamic response function

## Data Source

**Dataset:** Haxby dataset
**Data Key:** `nilearn.datasets.fetch_haxby`

## Prerequisites

**Required Capabilities:** nilearn_glm_tool; first_level

### Tool Installation

```bash
# Tool Setup Instructions

# Python packages
pip install scikit-learn nibabel nilearn

# Verify installation
python -c "import scikit_learn"  # Test Python imports
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_haxby()
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Model brain response to experimental conditions using general linear model with hemodynamic response function
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

- [ ] glm_fitted
- [ ] contrasts_computed

## Required Evidence Files

- [ ] `beta_maps.nii.gz`
- [ ] `contrast_zmap.nii.gz`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh beta_maps.nii.gz
   ls -lh contrast_zmap.nii.gz
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: glm_fitted
   - Verify: contrasts_computed

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
