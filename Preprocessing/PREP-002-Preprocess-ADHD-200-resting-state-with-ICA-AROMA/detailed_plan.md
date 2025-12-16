# Detailed Implementation Plan: PREP-002: Preprocess ADHD-200 resting-state with ICA-AROMA denoising

**Task ID:** PREP-002
**Category:** Preprocessing

## Overview

**Objective:** Preprocess ADHD-200 resting-state with ICA-AROMA denoising

**Context:** Remove motion artifacts from resting brain scans using independent component analysis to identify noise patterns

## Data Source

**Dataset:** ADHD-200 dataset
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** fmriprep_tool; ica_aroma_tool

### Tool Installation

```bash
# Tool Setup Instructions

# Container-based tools (via Singularity/Docker)
# fmriprep 23.1.3: Comprehensive fMRI preprocessing
# Available via Neurodesk or pull container:
# singularity pull docker://nipreps/fmriprep:23.1.3

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
   - Remove motion artifacts from resting brain scans using independent component analysis to identify noise patterns
   - Apply motion correction if needed
   - Apply spatial normalization if required

3. **Save preprocessed outputs**
   - Write processed data to NIfTI format
   - Ensure proper BIDS naming conventions

## Acceptance Criteria

- [ ] motion_artifacts_removed
- [ ] clean_timeseries

## Required Evidence Files

- [ ] `*_desc-smoothAROMAnonaggr_bold.nii.gz`
- [ ] `mixing_matrix.tsv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh *_desc-smoothAROMAnonaggr_bold.nii.gz
   ls -lh mixing_matrix.tsv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: motion_artifacts_removed
   - Verify: clean_timeseries

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
