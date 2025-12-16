# Detailed Implementation Plan: ML-011: Build multi-class SVM with one-vs-rest strategy for 8 Haxby categories

**Task ID:** ML-011
**Category:** Machine Learning

## Overview

**Objective:** Build multi-class SVM with one-vs-rest strategy for 8 Haxby categories

**Context:** Train separate binary classifier for each category against all others

## Data Source

**Dataset:** Haxby dataset
**Data Key:** `nilearn.datasets.fetch_haxby`

## Prerequisites

**Required Capabilities:** multiclass_svm_tool; ovr_strategy

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
   - Train separate binary classifier for each category against all others
   - Optimize hyperparameters using cross-validation

4. **Evaluate model performance**
   - Calculate accuracy, AUC, precision, recall
   - Generate confusion matrix and ROC curves

5. **Save trained model and results**
   - Serialize the trained model
   - Save predictions and evaluation metrics

## Acceptance Criteria

- [ ] 8_classifiers_trained
- [ ] macro_avg_f1>0.65

## Required Evidence Files

- [ ] `ovr_classifiers.pkl`
- [ ] `per_class_performance.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh ovr_classifiers.pkl
   ls -lh per_class_performance.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: 8_classifiers_trained
   - Verify: macro_avg_f1>0.65

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
