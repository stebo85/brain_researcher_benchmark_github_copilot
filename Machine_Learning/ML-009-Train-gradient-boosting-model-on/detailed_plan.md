# Detailed Implementation Plan: ML-009: Train gradient boosting model on HCP connectivity to predict fluid intelligence

**Task ID:** ML-009
**Category:** Machine Learning

## Overview

**Objective:** Train gradient boosting model on HCP connectivity to predict fluid intelligence

**Context:** Build ensemble of weak learners that sequentially correct each other's errors

## Data Source

**Dataset:** HCP MegaTrawls + behavior
**Data Key:** `nilearn.datasets.fetch_megatrawls_netmats`

## Prerequisites

**Required Capabilities:** gradient_boosting_tool; regression_tool

### Tool Installation and Setup

This analysis requires the following tools:

#### Python Packages

**Sklearn**
- **Purpose**: Scikit-learn for machine learning on brain features
- **Usage**: Use for SVM, random forests, regression, and cross-validation

```bash
# Install Python packages
pip install scikit-learn nilearn nibabel

# Verify installation
python -c "import scikit_learn; print('Successfully imported')"
```

#### Environment Verification

```bash
# Verify all tools are accessible
python -c "import scikit_learn"  # Should complete without error

# Check system resources
free -h  # Check available memory
df -h .  # Check available disk space
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
   - Build ensemble of weak learners that sequentially correct each other's errors
   - Optimize hyperparameters using cross-validation

4. **Evaluate model performance**
   - Calculate accuracy, AUC, precision, recall
   - Generate confusion matrix and ROC curves

5. **Save trained model and results**
   - Serialize the trained model
   - Save predictions and evaluation metrics

## Acceptance Criteria

- [ ] prediction_r>0.3
- [ ] feature_interactions_captured

## Required Evidence Files

- [ ] `trained_gbm.pkl`
- [ ] `intelligence_predictions.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh trained_gbm.pkl
   ls -lh intelligence_predictions.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: prediction_r>0.3
   - Verify: feature_interactions_captured

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
