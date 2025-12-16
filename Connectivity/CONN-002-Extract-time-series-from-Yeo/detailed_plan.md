# Detailed Implementation Plan: CONN-002: Extract time series from Yeo 7 networks and compute correlation matrix on NKI data

**Task ID:** CONN-002
**Category:** Connectivity

## Overview

**Objective:** Extract time series from Yeo 7 networks and compute correlation matrix on NKI data

**Context:** Pull out activity timecourses from the 7 major brain networks and see how strongly they correlate with each other

## Data Source

**Dataset:** NKI Enhanced
**Data Key:** `nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki`

## Prerequisites

**Required Capabilities:** connectivity_tool; nilearn_signal_extraction

### Tool Installation

```bash
# Tool Setup Instructions

# Python packages
pip install scikit-learn nibabel scipy nilearn

# Verify installation
python -c "import scikit_learn"  # Test Python imports
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

1. **Load preprocessed fMRI data**
   - Read time series data
   - Verify data quality

2. **Extract ROI time series**
   - Pull out activity timecourses from the 7 major brain networks and see how strongly they correlate with each other
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

- [ ] timeseries_extracted
- [ ] 7x7_correlation_matrix

## Required Evidence Files

- [ ] `network_timeseries.csv`
- [ ] `correlation_matrix.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh network_timeseries.csv
   ls -lh correlation_matrix.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: timeseries_extracted
   - Verify: 7x7_correlation_matrix

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
