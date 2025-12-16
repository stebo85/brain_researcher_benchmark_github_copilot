# Detailed Implementation Plan: PREP-009: Apply temporal filtering (0.01-0.1 Hz) to NKI resting-state

**Task ID:** PREP-009
**Category:** Preprocessing

## Overview

**Objective:** Apply temporal filtering (0.01-0.1 Hz) to NKI resting-state

**Context:** Keep only slow fluctuations relevant for resting-state networks by filtering out high frequencies

## Data Source

**Dataset:** NKI Enhanced dataset
**Data Key:** `nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki`

## Prerequisites

**Required Capabilities:** temporal_filter_tool; bandpass

### Tool Installation

```bash
# Required tools and libraries
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_surf_nki_enhanced(n_subjects=10)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the raw fMRI data**
   - Read the NIfTI files using nibabel
   - Verify data dimensions and headers

2. **Perform preprocessing steps**
   - Keep only slow fluctuations relevant for resting-state networks by filtering out high frequencies
   - Apply motion correction if needed
   - Apply spatial normalization if required

3. **Save preprocessed outputs**
   - Write processed data to NIfTI format
   - Ensure proper BIDS naming conventions

## Acceptance Criteria

- [ ] filtered_timeseries
- [ ] frequency_verified

## Required Evidence Files

- [ ] `filtered_bold.nii.gz`
- [ ] `power_spectrum.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh filtered_bold.nii.gz
   ls -lh power_spectrum.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: filtered_timeseries
   - Verify: frequency_verified

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
