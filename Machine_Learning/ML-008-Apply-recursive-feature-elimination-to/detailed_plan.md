# Detailed Implementation Plan: ML-008: Apply recursive feature elimination to find most informative voxels for decoding

**Task ID:** ML-008
**Category:** Machine Learning

## Overview

**Objective:** Apply recursive feature elimination to find most informative voxels for decoding

**Context:** Iteratively remove least important voxels while tracking classification performance

## Data Source

**Dataset:** Haxby dataset
**Data Key:** `nilearn.datasets.fetch_haxby`

## Prerequisites

**Required Capabilities:** rfe_tool; feature_selection_tool

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
   - Iteratively remove least important voxels while tracking classification performance
   - Optimize hyperparameters using cross-validation

4. **Evaluate model performance**
   - Calculate accuracy, AUC, precision, recall
   - Generate confusion matrix and ROC curves

5. **Save trained model and results**
   - Serialize the trained model
   - Save predictions and evaluation metrics

## Acceptance Criteria

- [ ] optimal_n_features_found
- [ ] accuracy_maximized

## Required Evidence Files

- [ ] `selected_voxels_mask.nii.gz`
- [ ] `rfe_scores.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh selected_voxels_mask.nii.gz
   ls -lh rfe_scores.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: optimal_n_features_found
   - Verify: accuracy_maximized

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
