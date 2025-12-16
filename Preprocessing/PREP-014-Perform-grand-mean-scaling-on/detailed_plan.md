# Detailed Implementation Plan: PREP-014: Perform grand mean scaling on Brainomics group data

**Task ID:** PREP-014
**Category:** Preprocessing

## Overview

**Objective:** Perform grand mean scaling on Brainomics group data

**Context:** Scale all subjects' intensities to same average value so group statistics are comparable

## Data Source

**Dataset:** Brainomics Localizer dataset
**Data Key:** `nilearn.datasets.fetch_localizer_contrasts`

## Prerequisites

**Required Capabilities:** scaling_tool; intensity_standardization

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
data = datasets.fetch_localizer_contrasts()
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the raw fMRI data**
   - Read the NIfTI files using nibabel
   - Verify data dimensions and headers

2. **Perform preprocessing steps**
   - Scale all subjects' intensities to same average value so group statistics are comparable
   - Apply motion correction if needed
   - Apply spatial normalization if required

3. **Save preprocessed outputs**
   - Write processed data to NIfTI format
   - Ensure proper BIDS naming conventions

## Acceptance Criteria

- [ ] scaling_applied
- [ ] mean_value=10000

## Required Evidence Files

- [ ] `scaled_bold.nii.gz`
- [ ] `scaling_factors.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh scaled_bold.nii.gz
   ls -lh scaling_factors.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: scaling_applied
   - Verify: mean_value=10000

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
