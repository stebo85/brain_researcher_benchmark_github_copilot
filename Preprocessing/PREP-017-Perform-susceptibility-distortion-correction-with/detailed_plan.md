# Detailed Implementation Plan: PREP-017: Perform susceptibility distortion correction with opposite phase encoding on FIAC

**Task ID:** PREP-017
**Category:** Preprocessing

## Overview

**Objective:** Perform susceptibility distortion correction with opposite phase encoding on FIAC

**Context:** Use scans acquired with reversed phase encoding direction to estimate and correct distortions

## Data Source

**Dataset:** FIAC dataset
**Data Key:** `nilearn.datasets.fetch_fiac_first_level`

## Prerequisites

**Required Capabilities:** topup_tool; sdc_correction

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
data = datasets.fetch_fiac_first_level()
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the raw fMRI data**
   - Read the NIfTI files using nibabel
   - Verify data dimensions and headers

2. **Perform preprocessing steps**
   - Use scans acquired with reversed phase encoding direction to estimate and correct distortions
   - Apply motion correction if needed
   - Apply spatial normalization if required

3. **Save preprocessed outputs**
   - Write processed data to NIfTI format
   - Ensure proper BIDS naming conventions

## Acceptance Criteria

- [ ] distortions_corrected
- [ ] displacement_field

## Required Evidence Files

- [ ] `corrected_bold.nii.gz`
- [ ] `fieldmap_hz.nii.gz`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh corrected_bold.nii.gz
   ls -lh fieldmap_hz.nii.gz
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: distortions_corrected
   - Verify: displacement_field

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
