# Detailed Implementation Plan: REG-019: Register atlas labels to Development fMRI native space for ROI analysis

**Task ID:** REG-019
**Category:** Registration

## Overview

**Objective:** Register atlas labels to Development fMRI native space for ROI analysis

**Context:** Bring standard brain atlas into subject space for extracting signals from regions

## Data Source

**Dataset:** Development fMRI dataset
**Data Key:** `nilearn.datasets.fetch_development_fmri`

## Prerequisites

**Required Capabilities:** atlas_registration; inverse_transform

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

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Bring standard brain atlas into subject space for extracting signals from regions
   - Register atlas labels to Development fMRI native space for ROI analysis

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] labels_in_native
- [ ] parcellation_complete

## Required Evidence Files

- [ ] `native_atlas_labels.nii.gz`
- [ ] `roi_definitions.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh native_atlas_labels.nii.gz
   ls -lh roi_definitions.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: labels_in_native
   - Verify: parcellation_complete

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
