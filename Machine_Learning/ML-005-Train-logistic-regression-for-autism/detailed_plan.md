# Detailed Implementation Plan: ML-005: Train logistic regression for autism classification on ABIDE resting-state

**Task ID:** ML-005
**Category:** Machine Learning

## Overview

**Objective:** Train logistic regression for autism classification on ABIDE resting-state

**Context:** Build linear classifier with L2 regularization to predict autism from connectivity patterns

## Data Source

**Dataset:** ABIDE functional connectivity
**Data Key:** `nilearn.datasets.fetch_abide_pcp`

## Prerequisites

**Required Capabilities:** logistic_regression_tool; classification_tool

### Tool Installation

```bash
# Required tools and libraries
pip install scikit-learn nibabel nilearn
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_abide_pcp(n_subjects=30, pipeline='cpac')
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
   - Build linear classifier with L2 regularization to predict autism from connectivity patterns
   - Optimize hyperparameters using cross-validation

4. **Evaluate model performance**
   - Calculate accuracy, AUC, precision, recall
   - Generate confusion matrix and ROC curves

5. **Save trained model and results**
   - Serialize the trained model
   - Save predictions and evaluation metrics

## Acceptance Criteria

- [ ] auc>0.7
- [ ] calibrated_probabilities

## Required Evidence Files

- [ ] `trained_lr.pkl`
- [ ] `roc_curve.png`
- [ ] `predictions.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh trained_lr.pkl
   ls -lh roc_curve.png
   ls -lh predictions.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: auc>0.7
   - Verify: calibrated_probabilities

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
