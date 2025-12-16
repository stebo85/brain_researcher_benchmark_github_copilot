# Detailed Implementation Plan: ML-014: Perform stratified k-fold CV ensuring balanced classes in ADHD dataset

**Task ID:** ML-014
**Category:** Machine Learning

## Overview

**Objective:** Perform stratified k-fold CV ensuring balanced classes in ADHD dataset

**Context:** Split data preserving proportion of ADHD vs control in each fold for fair evaluation

## Data Source

**Dataset:** ADHD-200
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** stratified_cv_tool; classification_tool

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
   - Split data preserving proportion of ADHD vs control in each fold for fair evaluation
   - Optimize hyperparameters using cross-validation

4. **Evaluate model performance**
   - Calculate accuracy, AUC, precision, recall
   - Generate confusion matrix and ROC curves

5. **Save trained model and results**
   - Serialize the trained model
   - Save predictions and evaluation metrics

## Acceptance Criteria

- [ ] class_balance_maintained
- [ ] unbiased_accuracy

## Required Evidence Files

- [ ] `cv_fold_indices.json`
- [ ] `cv_scores_per_fold.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh cv_fold_indices.json
   ls -lh cv_scores_per_fold.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: class_balance_maintained
   - Verify: unbiased_accuracy

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
