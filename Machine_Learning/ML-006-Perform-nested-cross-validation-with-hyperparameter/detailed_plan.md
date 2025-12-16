# Detailed Implementation Plan: ML-006: Perform nested cross-validation with hyperparameter tuning for ADHD prediction

**Task ID:** ML-006
**Category:** Machine Learning

## Overview

**Objective:** Perform nested cross-validation with hyperparameter tuning for ADHD prediction

**Context:** Use inner loops for parameter selection and outer loops for unbiased performance estimation

## Data Source

**Dataset:** ADHD-200
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** nested_cv_tool; hyperparameter_tuning

### Tool Installation and Setup

This analysis requires the following tools:

#### Required Tools

The specific tools needed are listed in the **Required Capabilities** section above.

```bash
# Search for available tools in Neurodesk
ml av  # List all available modules
ml av <toolname>  # Search for specific tool

# Load required tools
module load <toolname>/<version>

# Install Python packages if needed
pip install <package-name>
```

#### Environment Verification

```bash
# Verify all tools are accessible

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
   - Use inner loops for parameter selection and outer loops for unbiased performance estimation
   - Optimize hyperparameters using cross-validation

4. **Evaluate model performance**
   - Calculate accuracy, AUC, precision, recall
   - Generate confusion matrix and ROC curves

5. **Save trained model and results**
   - Serialize the trained model
   - Save predictions and evaluation metrics

## Acceptance Criteria

- [ ] unbiased_accuracy_estimated
- [ ] optimal_params_selected

## Required Evidence Files

- [ ] `cv_results.csv`
- [ ] `param_grid_search.json`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh cv_results.csv
   ls -lh param_grid_search.json
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: unbiased_accuracy_estimated
   - Verify: optimal_params_selected

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
