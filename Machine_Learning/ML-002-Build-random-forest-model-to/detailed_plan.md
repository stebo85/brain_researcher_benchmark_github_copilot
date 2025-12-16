# Detailed Implementation Plan: ML-002: Build random forest model to predict ADHD diagnosis from connectivity

**Task ID:** ML-002
**Category:** Machine Learning

## Overview

**Objective:** Build random forest model to predict ADHD diagnosis from connectivity

**Context:** Train ensemble of decision trees on brain connectivity features to classify ADHD vs control

## Data Source

**Dataset:** ADHD-200 connectivity
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** random_forest_tool; classification_tool

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
data = datasets.fetch_adhd(n_subjects=30)
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
   - Train ensemble of decision trees on brain connectivity features to classify ADHD vs control
   - Optimize hyperparameters using cross-validation

4. **Evaluate model performance**
   - Calculate accuracy, AUC, precision, recall
   - Generate confusion matrix and ROC curves

5. **Save trained model and results**
   - Serialize the trained model
   - Save predictions and evaluation metrics

## Acceptance Criteria

- [ ] balanced_accuracy>0.65
- [ ] feature_importance_ranked

## Required Evidence Files

- [ ] `trained_rf.pkl`
- [ ] `feature_importance.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh trained_rf.pkl
   ls -lh feature_importance.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: balanced_accuracy>0.65
   - Verify: feature_importance_ranked

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
