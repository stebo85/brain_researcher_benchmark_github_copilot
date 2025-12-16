# Detailed Implementation Plan: ML-013: Train elastic net regression combining L1 and L2 penalties for connectivity

**Task ID:** ML-013
**Category:** Machine Learning

## Overview

**Objective:** Train elastic net regression combining L1 and L2 penalties for connectivity

**Context:** Use regularization that both selects features and prevents overfitting for age prediction

## Data Source

**Dataset:** HCP MegaTrawls
**Data Key:** `nilearn.datasets.fetch_megatrawls_netmats`

## Prerequisites

**Required Capabilities:** elastic_net_tool; regularization_tool

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
data = datasets.fetch_megatrawls_netmats()
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
   - Use regularization that both selects features and prevents overfitting for age prediction
   - Optimize hyperparameters using cross-validation

4. **Evaluate model performance**
   - Calculate accuracy, AUC, precision, recall
   - Generate confusion matrix and ROC curves

5. **Save trained model and results**
   - Serialize the trained model
   - Save predictions and evaluation metrics

## Acceptance Criteria

- [ ] sparse_solution
- [ ] prediction_mae<5_years

## Required Evidence Files

- [ ] `trained_enet.pkl`
- [ ] `nonzero_weights.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh trained_enet.pkl
   ls -lh nonzero_weights.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: sparse_solution
   - Verify: prediction_mae<5_years

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
