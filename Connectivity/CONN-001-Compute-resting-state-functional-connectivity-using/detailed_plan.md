# Detailed Implementation Plan: CONN-001: Compute resting-state functional connectivity using MSDL atlas on ADHD dataset

**Task ID:** CONN-001
**Category:** Connectivity

## Overview

**Objective:** Compute resting-state functional connectivity using MSDL atlas on ADHD dataset

**Context:** Calculate how brain regions communicate during rest using a 39-region atlas to compare ADHD vs control subjects

## Data Source

**Dataset:** ADHD-200
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** conn_tool; dynamic_connectivity_tool

### Tool Installation

```bash
# Required tools and libraries
pip install nilearn nibabel scipy
pip install nilearn nibabel scipy
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_adhd(n_subjects=30)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load preprocessed fMRI data**
   - Read time series data
   - Verify data quality

2. **Extract ROI time series**
   - Calculate how brain regions communicate during rest using a 39-region atlas to compare ADHD vs control subjects
   - Use specified atlas for parcellation
   - Extract mean time series from each ROI

3. **Compute connectivity matrix**
   - Calculate Pearson correlation between ROI time series
   - Apply Fisher z-transformation

4. **Perform group-level analysis**
   - Compare connectivity between groups if applicable
   - Apply statistical tests

5. **Save connectivity results**
   - Export connectivity matrices
   - Save statistical comparison results

## Acceptance Criteria

- [ ] matrix_39x39_generated
- [ ] group_differences_detected

## Required Evidence Files

- [ ] `connectivity_matrix.npy`
- [ ] `group_comparison.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh connectivity_matrix.npy
   ls -lh group_comparison.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: matrix_39x39_generated
   - Verify: group_differences_detected

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
