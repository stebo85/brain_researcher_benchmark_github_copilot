# Detailed Implementation Plan: STAT-013: Run non-parametric Kruskal-Wallis test on ADHD symptom correlations

**Task ID:** STAT-013
**Category:** Statistical Analysis

## Overview

**Objective:** Run non-parametric Kruskal-Wallis test on ADHD symptom correlations

**Context:** Test group differences without assuming normality using rank-based statistics

## Data Source

**Dataset:** ADHD-200 dataset
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** nonparametric_tool; kruskal_wallis

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
   - Test group differences without assuming normality using rank-based statistics
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

- [ ] kw_test_complete
- [ ] h_statistic_computed

## Required Evidence Files

- [ ] `kruskal_results.csv`
- [ ] `post_hoc_comparisons.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh kruskal_results.csv
   ls -lh post_hoc_comparisons.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: kw_test_complete
   - Verify: h_statistic_computed

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
