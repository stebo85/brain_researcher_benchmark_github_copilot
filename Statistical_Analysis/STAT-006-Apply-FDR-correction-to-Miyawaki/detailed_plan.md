# Detailed Implementation Plan: STAT-006: Apply FDR correction to Miyawaki decoding searchlight results

**Task ID:** STAT-006
**Category:** Statistical Analysis

## Overview

**Objective:** Apply FDR correction to Miyawaki decoding searchlight results

**Context:** Control false discovery rate across multiple comparisons for spatial maps

## Data Source

**Dataset:** Miyawaki dataset
**Data Key:** `nilearn.datasets.fetch_miyawaki2008`

## Prerequisites

**Required Capabilities:** fdr_correction_tool; multiple_comparisons

### Tool Installation

```bash
# Tool Setup Instructions

# Install required tools based on task requirements
# Use 'ml av' to see available Neurodesk modules
# Use 'pip install <package>' for Python packages

# Verify installation
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_miyawaki2008()
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Control false discovery rate across multiple comparisons for spatial maps
   - Define design matrix and contrasts

3. **Perform statistical analysis**
   - Fit the model to data
   - Compute test statistics
   - Apply multiple comparison corrections

4. **Generate statistical maps**
   - Create thresholded maps
   - Identify significant clusters

5. **Save statistical results**
   - Export statistical maps
   - Save cluster information and statistics

## Acceptance Criteria

- [ ] fdr_applied
- [ ] q<0.05

## Required Evidence Files

- [ ] `fdr_corrected_map.nii.gz`
- [ ] `significant_voxels.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh fdr_corrected_map.nii.gz
   ls -lh significant_voxels.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: fdr_applied
   - Verify: q<0.05

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
