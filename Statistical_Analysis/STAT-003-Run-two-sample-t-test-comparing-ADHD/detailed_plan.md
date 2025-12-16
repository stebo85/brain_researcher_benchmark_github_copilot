# Detailed Implementation Plan: STAT-003: Run two-sample t-test comparing ADHD vs controls on ReHo maps

**Task ID:** STAT-003
**Category:** Statistical Analysis

## Overview

**Objective:** Run two-sample t-test comparing ADHD vs controls on ReHo maps

**Context:** Compare two groups to find regions with different local synchronization using independent samples test

## Data Source

**Dataset:** ADHD-200 dataset
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** statistical_comparison_tool; group_difference

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
data = datasets.fetch_adhd(n_subjects=30)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Compare two groups to find regions with different local synchronization using independent samples test
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

- [ ] two_sample_complete
- [ ] corrected_p<0.05

## Required Evidence Files

- [ ] `adhd_vs_control_tmap.nii.gz`
- [ ] `significant_clusters.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh adhd_vs_control_tmap.nii.gz
   ls -lh significant_clusters.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: two_sample_complete
   - Verify: corrected_p<0.05

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
