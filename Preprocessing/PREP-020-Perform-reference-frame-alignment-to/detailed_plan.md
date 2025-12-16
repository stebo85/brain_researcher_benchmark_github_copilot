# Detailed Implementation Plan: PREP-020: Perform reference frame alignment to AC-PC line on OASIS

**Task ID:** PREP-020
**Category:** Preprocessing

## Overview

**Objective:** Perform reference frame alignment to AC-PC line on OASIS

**Context:** Rotate brain images so they align with standard anatomical landmarks (anterior/posterior commissure)

## Data Source

**Dataset:** OASIS VBM dataset
**Data Key:** `nilearn.datasets.fetch_oasis_vbm`

## Prerequisites

**Required Capabilities:** acpc_alignment_tool; rigid_registration

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
   - Rotate brain images so they align with standard anatomical landmarks (anterior/posterior commissure)
   - Apply motion correction if needed
   - Apply spatial normalization if required

3. **Save preprocessed outputs**
   - Write processed data to NIfTI format
   - Ensure proper BIDS naming conventions

## Acceptance Criteria

- [ ] acpc_aligned
- [ ] rotation_minimal

## Required Evidence Files

- [ ] `acpc_aligned.nii.gz`
- [ ] `rotation_matrix.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh acpc_aligned.nii.gz
   ls -lh rotation_matrix.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: acpc_aligned
   - Verify: rotation_minimal

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
