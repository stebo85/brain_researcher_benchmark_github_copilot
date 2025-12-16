# Detailed Implementation Plan: STAT-005: Run paired t-test on NKI test-retest connectivity matrices

**Task ID:** STAT-005
**Category:** Statistical Analysis

## Overview

**Objective:** Run paired t-test on NKI test-retest connectivity matrices

**Context:** Compare same subjects across two sessions to test for systematic differences in measurements

## Data Source

**Dataset:** NKI Enhanced dataset
**Data Key:** `nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki`

## Prerequisites

**Required Capabilities:** paired_test_tool; within_subject

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
data = datasets.fetch_surf_nki_enhanced(n_subjects=10)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Compare same subjects across two sessions to test for systematic differences in measurements
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

- [ ] paired_complete
- [ ] difference_map_generated

## Required Evidence Files

- [ ] `paired_tmap.nii.gz`
- [ ] `reliability_metrics.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh paired_tmap.nii.gz
   ls -lh reliability_metrics.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: paired_complete
   - Verify: difference_map_generated

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
