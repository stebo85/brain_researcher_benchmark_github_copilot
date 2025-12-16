# Detailed Implementation Plan: PREP-007: Run skull stripping on OASIS structural images

**Task ID:** PREP-007
**Category:** Preprocessing

## Overview

**Objective:** Run skull stripping on OASIS structural images

**Context:** Remove non-brain tissue like skull and scalp to focus analysis on brain only

## Data Source

**Dataset:** OASIS VBM dataset
**Data Key:** `nilearn.datasets.fetch_oasis_vbm`

## Prerequisites

**Required Capabilities:** skull_stripping_tool; bet_tool

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
data = datasets.fetch_oasis_vbm(n_subjects=50)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the raw fMRI data**
   - Read the NIfTI files using nibabel
   - Verify data dimensions and headers

2. **Perform preprocessing steps**
   - Remove non-brain tissue like skull and scalp to focus analysis on brain only
   - Apply motion correction if needed
   - Apply spatial normalization if required

3. **Save preprocessed outputs**
   - Write processed data to NIfTI format
   - Ensure proper BIDS naming conventions

## Acceptance Criteria

- [ ] brain_extracted
- [ ] no_skull_present

## Required Evidence Files

- [ ] `brain_mask.nii.gz`
- [ ] `brain_extracted.nii.gz`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh brain_mask.nii.gz
   ls -lh brain_extracted.nii.gz
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: brain_extracted
   - Verify: no_skull_present

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
