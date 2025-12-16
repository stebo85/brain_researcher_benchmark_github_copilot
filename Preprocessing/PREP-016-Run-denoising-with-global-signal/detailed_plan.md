# Detailed Implementation Plan: PREP-016: Run denoising with global signal regression on ABIDE

**Task ID:** PREP-016
**Category:** Preprocessing

## Overview

**Objective:** Run denoising with global signal regression on ABIDE

**Context:** Remove global brain fluctuations that may represent non-neural noise

## Data Source

**Dataset:** ABIDE dataset
**Data Key:** `nilearn.datasets.fetch_abide_pcp`

## Prerequisites

**Required Capabilities:** global_signal_tool; nuisance_regression

### Tool Installation

```bash
# Tool Setup Instructions

# Python packages
pip install nibabel nilearn scikit-learn

# Verify installation
python -c "import nibabel"  # Test Python imports
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_abide_pcp(n_subjects=30, pipeline='cpac')
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the raw fMRI data**
   - Read the NIfTI files using nibabel
   - Verify data dimensions and headers

2. **Perform preprocessing steps**
   - Remove global brain fluctuations that may represent non-neural noise
   - Apply motion correction if needed
   - Apply spatial normalization if required

3. **Save preprocessed outputs**
   - Write processed data to NIfTI format
   - Ensure proper BIDS naming conventions

## Acceptance Criteria

- [ ] global_signal_removed
- [ ] variance_reduced

## Required Evidence Files

- [ ] `gsr_bold.nii.gz`
- [ ] `global_signal_timeseries.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh gsr_bold.nii.gz
   ls -lh global_signal_timeseries.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: global_signal_removed
   - Verify: variance_reduced

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
