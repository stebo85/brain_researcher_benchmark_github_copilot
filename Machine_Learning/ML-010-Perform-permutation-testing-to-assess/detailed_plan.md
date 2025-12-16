# Detailed Implementation Plan: ML-010: Perform permutation testing to assess statistical significance of decoder

**Task ID:** ML-010
**Category:** Machine Learning

## Overview

**Objective:** Perform permutation testing to assess statistical significance of decoder

**Context:** Shuffle labels many times to build null distribution and test if accuracy is above chance

## Data Source

**Dataset:** Haxby dataset
**Data Key:** `nilearn.datasets.fetch_haxby`

## Prerequisites

**Required Capabilities:** permutation_testing_tool; statistical_validation

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
data = datasets.fetch_haxby()
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
   - Shuffle labels many times to build null distribution and test if accuracy is above chance
   - Optimize hyperparameters using cross-validation

4. **Evaluate model performance**
   - Calculate accuracy, AUC, precision, recall
   - Generate confusion matrix and ROC curves

5. **Save trained model and results**
   - Serialize the trained model
   - Save predictions and evaluation metrics

## Acceptance Criteria

- [ ] p_value<0.05
- [ ] null_distribution_generated

## Required Evidence Files

- [ ] `permutation_pvalues.csv`
- [ ] `null_histogram.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh permutation_pvalues.csv
   ls -lh null_histogram.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: p_value<0.05
   - Verify: null_distribution_generated

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
