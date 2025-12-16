# Detailed Implementation Plan: ML-012: Apply ANOVA feature selection before classification on Localizer data

**Task ID:** ML-012
**Category:** Machine Learning

## Overview

**Objective:** Apply ANOVA feature selection before classification on Localizer data

**Context:** Use univariate statistics to preselect most task-responsive voxels before training classifier

## Data Source

**Dataset:** Brainomics Localizer
**Data Key:** `nilearn.datasets.fetch_localizer_contrasts`

## Prerequisites

**Required Capabilities:** anova_feature_selection; mvpa_tool

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
data = datasets.fetch_localizer_contrasts()
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load and prepare the dataset**
   - Fetch the data using the specified data key
   - Extract features from brain images or connectivity matrices

2. **Split data into training and testing sets**
   - Use stratified split to maintain class balance
   - Consider cross-validation for robust evaluation

3. **Train the model**
   - Use univariate statistics to preselect most task-responsive voxels before training classifier
   - Optimize hyperparameters using cross-validation

4. **Evaluate model performance**
   - Calculate accuracy, AUC, precision, recall
   - Generate confusion matrix and ROC curves

5. **Save trained model and results**
   - Serialize the trained model
   - Save predictions and evaluation metrics

## Acceptance Criteria

- [ ] top_1000_voxels_selected
- [ ] accuracy_improved

## Required Evidence Files

- [ ] `selected_voxels.nii.gz`
- [ ] `anova_fscores.npy`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh selected_voxels.nii.gz
   ls -lh anova_fscores.npy
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: top_1000_voxels_selected
   - Verify: accuracy_improved

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
