# Detailed Implementation Plan: ML-019: Build calibrated probability estimates for clinical decision support

**Task ID:** ML-019
**Category:** Machine Learning

## Overview

**Objective:** Build calibrated probability estimates for clinical decision support

**Context:** Transform classifier scores into well-calibrated probabilities using Platt scaling or isotonic regression

## Data Source

**Dataset:** ADHD-200
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** probability_calibration_tool; clinical_tool

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
   - Transform classifier scores into well-calibrated probabilities using Platt scaling or isotonic regression
   - Optimize hyperparameters using cross-validation

4. **Evaluate model performance**
   - Calculate accuracy, AUC, precision, recall
   - Generate confusion matrix and ROC curves

5. **Save trained model and results**
   - Serialize the trained model
   - Save predictions and evaluation metrics

## Acceptance Criteria

- [ ] calibration_curve_diagonal
- [ ] brier_score_low

## Required Evidence Files

- [ ] `calibrated_probabilities.csv`
- [ ] `calibration_plot.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh calibrated_probabilities.csv
   ls -lh calibration_plot.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: calibration_curve_diagonal
   - Verify: brier_score_low

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
