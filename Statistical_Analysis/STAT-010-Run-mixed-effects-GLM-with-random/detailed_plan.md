# Detailed Implementation Plan: STAT-010: Run mixed-effects GLM with random intercepts for FIAC multi-run

**Task ID:** STAT-010
**Category:** Statistical Analysis

## Overview

**Objective:** Run mixed-effects GLM with random intercepts for FIAC multi-run

**Context:** Model both fixed effects (across subjects) and random effects (within subjects) simultaneously

## Data Source

**Dataset:** FIAC dataset
**Data Key:** `nilearn.datasets.fetch_fiac_first_level`

## Prerequisites

**Required Capabilities:** mixed_effects_tool; hierarchical_model

### Tool Installation

```bash
# Tool Setup Instructions

# Install required tools based on task requirements
# Use 'ml av' to see available Neurodesk modules
# Use 'pip install <package>' for Python packages

# Verify installation
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_fiac_first_level()
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Model both fixed effects (across subjects) and random effects (within subjects) simultaneously
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

- [ ] mixed_model_fitted
- [ ] variance_components

## Required Evidence Files

- [ ] `fixed_effects.nii.gz`
- [ ] `random_effects_variance.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh fixed_effects.nii.gz
   ls -lh random_effects_variance.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: mixed_model_fitted
   - Verify: variance_components

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
