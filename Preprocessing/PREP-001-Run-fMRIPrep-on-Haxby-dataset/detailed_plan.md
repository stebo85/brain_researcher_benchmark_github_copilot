# Detailed Implementation Plan: PREP-001: Run fMRIPrep on Haxby dataset with FreeSurfer surface reconstruction

**Task ID:** PREP-001
**Category:** Preprocessing

## Overview

**Objective:** Run fMRIPrep on Haxby dataset with FreeSurfer surface reconstruction

**Context:** Clean up raw fMRI data with motion correction, distortion correction, normalize to standard space, and reconstruct cortical surfaces

## Data Source

**Dataset:** Haxby dataset
**Data Key:** `openneuro ds000105 or nilearn.datasets.fetch_haxby`

## Prerequisites

**Required Capabilities:** fmriprep_tool; freesurfer_tool

### Tool Installation

```bash
# Tool Setup Instructions

# Neuroimaging tools (available via Neurodesk)
module load freesurfer/7.3.2

# Container-based tools (via Singularity/Docker)
# fmriprep 23.1.3: Comprehensive fMRI preprocessing
# Available via Neurodesk or pull container:
# singularity pull docker://nipreps/fmriprep:23.1.3

# Verify installation
ml list  # Check loaded modules
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
   - Clean up raw fMRI data with motion correction, distortion correction, normalize to standard space, and reconstruct cortical surfaces
   - Apply motion correction if needed
   - Apply spatial normalization if required

3. **Save preprocessed outputs**
   - Write processed data to NIfTI format
   - Ensure proper BIDS naming conventions

## Acceptance Criteria

- [ ] preprocessing_complete
- [ ] surfaces_reconstructed

## Required Evidence Files

- [ ] `sub-*/func/*_space-MNI_bold.nii.gz`
- [ ] `sub-*/anat/surf/`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh sub-*/func/*_space-MNI_bold.nii.gz
   ls -lh sub-*/anat/surf/
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: preprocessing_complete
   - Verify: surfaces_reconstructed

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
