# Detailed Implementation Plan: CONN-019: Calculate connectome-based predictive modeling for ADHD diagnosis

**Task ID:** CONN-019
**Category:** Connectivity

## Overview

**Objective:** Calculate connectome-based predictive modeling for ADHD diagnosis

**Context:** Use whole-brain connectivity patterns to build a predictive model that classifies ADHD vs control

## Data Source

**Dataset:** ADHD-200
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** connectivity_tool; mvpa_tool; cross_validation_tool

### Tool Installation

```bash
# Required tools and libraries
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
   - Use whole-brain connectivity patterns to build a predictive model that classifies ADHD vs control
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

- [ ] cpm_accuracy>0.7
- [ ] positive_negative_networks

## Required Evidence Files

- [ ] `cpm_edges.csv`
- [ ] `prediction_accuracy.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh cpm_edges.csv
   ls -lh prediction_accuracy.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: cpm_accuracy>0.7
   - Verify: positive_negative_networks

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
