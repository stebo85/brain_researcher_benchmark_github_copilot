# Detailed Implementation Plan: CONN-009: Build structural-functional coupling map using Schaefer 400 atlas on ABIDE

**Task ID:** CONN-009
**Category:** Connectivity

## Overview

**Objective:** Build structural-functional coupling map using Schaefer 400 atlas on ABIDE

**Context:** Compare patterns of anatomical connectivity (white matter) with functional connectivity (correlated activity)

## Data Source

**Dataset:** ABIDE
**Data Key:** `nilearn.datasets.fetch_abide_pcp`

## Prerequisites

**Required Capabilities:** connectivity_tool; multimodal_integration_tool

### Tool Installation

```bash
# Tool Setup Instructions

# Python packages
pip install nibabel scipy nilearn

# Verify installation
python -c "import nibabel"  # Test Python imports
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_abide_pcp(n_subjects=30, pipeline='cpac')
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load preprocessed fMRI data**
   - Read time series data
   - Verify data quality

2. **Extract ROI time series**
   - Compare patterns of anatomical connectivity (white matter) with functional connectivity (correlated activity)
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

- [ ] coupling_map_400_regions
- [ ] correlation_r

## Required Evidence Files

- [ ] `sc_fc_coupling.npy`
- [ ] `coupling_histogram.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh sc_fc_coupling.npy
   ls -lh coupling_histogram.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: coupling_map_400_regions
   - Verify: correlation_r

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
