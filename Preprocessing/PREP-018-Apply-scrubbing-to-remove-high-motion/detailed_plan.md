# Detailed Implementation Plan: PREP-018: Apply scrubbing to remove high-motion volumes from Development fMRI

**Task ID:** PREP-018
**Category:** Preprocessing

## Overview

**Objective:** Apply scrubbing to remove high-motion volumes from Development fMRI

**Context:** Identify and censor volumes with excessive motion rather than using them in analysis

## Data Source

**Dataset:** Development fMRI dataset
**Data Key:** `nilearn.datasets.fetch_development_fmri`

## Prerequisites

**Required Capabilities:** scrubbing_tool; motion_censoring

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
data = datasets.fetch_development_fmri(n_subjects=30)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the raw fMRI data**
   - Read the NIfTI files using nibabel
   - Verify data dimensions and headers

2. **Perform preprocessing steps**
   - Identify and censor volumes with excessive motion rather than using them in analysis
   - Apply motion correction if needed
   - Apply spatial normalization if required

3. **Save preprocessed outputs**
   - Write processed data to NIfTI format
   - Ensure proper BIDS naming conventions

## Acceptance Criteria

- [ ] high_motion_censored
- [ ] fd_threshold=0.5mm

## Required Evidence Files

- [ ] `scrubbed_bold.nii.gz`
- [ ] `censoring_mask.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh scrubbed_bold.nii.gz
   ls -lh censoring_mask.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: high_motion_censored
   - Verify: fd_threshold=0.5mm

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
