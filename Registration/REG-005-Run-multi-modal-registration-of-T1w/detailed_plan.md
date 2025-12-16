# Detailed Implementation Plan: REG-005: Run multi-modal registration of T1w to T2w for SPM multimodal

**Task ID:** REG-005
**Category:** Registration

## Overview

**Objective:** Run multi-modal registration of T1w to T2w for SPM multimodal

**Context:** Align images from different MRI sequences accounting for contrast differences

## Data Source

**Dataset:** SPM multimodal dataset
**Data Key:** `nilearn.datasets.fetch_spm_multimodal_fmri`

## Prerequisites

**Required Capabilities:** multimodal_registration; spm_coreg

### Tool Installation and Setup

This analysis requires the following tools:

#### Neuroimaging Software (via Neurodesk)

**SPM12 12.7219**
- **Purpose**: SPM12 (Statistical Parametric Mapping) for fMRI/PET analysis
- **Usage**: Use for preprocessing, statistical modeling, and group analysis
- **Loading**: Available through Neurodesk's module system

```bash
# Load spm12 from Neurodesk
module load spm12/12.7219

# Verify spm12 is loaded
ml list

# Check spm12 commands are available
which matlab -batch "spm"
```

#### Environment Verification

```bash
# Verify all tools are accessible
ml list  # Should show loaded modules

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
data = datasets.fetch_spm_multimodal_fmri()
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Align images from different MRI sequences accounting for contrast differences
   - Run multi-modal registration of T1w to T2w for SPM multimodal

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] modalities_aligned
- [ ] mutual_information_max

## Required Evidence Files

- [ ] `t1_to_t2_matrix.mat`
- [ ] `coregistered_t1.nii.gz`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh t1_to_t2_matrix.mat
   ls -lh coregistered_t1.nii.gz
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: modalities_aligned
   - Verify: mutual_information_max

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
