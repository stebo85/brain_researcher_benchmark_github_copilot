# Detailed Implementation Plan: PREP-012: Apply CompCor for physiological noise removal on Haxby

**Task ID:** PREP-012
**Category:** Preprocessing

## Overview

**Objective:** Apply CompCor for physiological noise removal on Haxby

**Context:** Remove breathing and heartbeat artifacts by modeling noise from white matter and CSF

## Data Source

**Dataset:** Haxby dataset
**Data Key:** `nilearn.datasets.fetch_haxby`

## Prerequisites

**Required Capabilities:** compcor_tool; nuisance_regression

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

1. **Load the raw fMRI data**
   - Read the NIfTI files using nibabel
   - Verify data dimensions and headers

2. **Perform preprocessing steps**
   - Remove breathing and heartbeat artifacts by modeling noise from white matter and CSF
   - Apply motion correction if needed
   - Apply spatial normalization if required

3. **Save preprocessed outputs**
   - Write processed data to NIfTI format
   - Ensure proper BIDS naming conventions

## Acceptance Criteria

- [ ] physiological_noise_removed
- [ ] confounds_computed

## Required Evidence Files

- [ ] `cleaned_bold.nii.gz`
- [ ] `compcor_components.tsv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh cleaned_bold.nii.gz
   ls -lh compcor_components.tsv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: physiological_noise_removed
   - Verify: confounds_computed

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
