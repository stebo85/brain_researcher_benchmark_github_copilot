# Detailed Implementation Plan: PREP-013: Run AFNI 3dDespike to remove extreme outliers from ADHD data

**Task ID:** PREP-013
**Category:** Preprocessing

## Overview

**Objective:** Run AFNI 3dDespike to remove extreme outliers from ADHD data

**Context:** Detect and fix sudden intensity spikes caused by scanner artifacts or motion

## Data Source

**Dataset:** ADHD-200 dataset
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** despike_tool; outlier_detection

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

1. **Load the raw fMRI data**
   - Read the NIfTI files using nibabel
   - Verify data dimensions and headers

2. **Perform preprocessing steps**
   - Detect and fix sudden intensity spikes caused by scanner artifacts or motion
   - Apply motion correction if needed
   - Apply spatial normalization if required

3. **Save preprocessed outputs**
   - Write processed data to NIfTI format
   - Ensure proper BIDS naming conventions

## Acceptance Criteria

- [ ] spikes_removed
- [ ] timeseries_smooth

## Required Evidence Files

- [ ] `despiked_bold.nii.gz`
- [ ] `spike_report.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh despiked_bold.nii.gz
   ls -lh spike_report.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: spikes_removed
   - Verify: timeseries_smooth

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
