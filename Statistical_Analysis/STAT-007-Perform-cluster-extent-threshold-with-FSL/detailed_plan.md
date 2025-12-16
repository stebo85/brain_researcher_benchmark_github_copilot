# Detailed Implementation Plan: STAT-007: Perform cluster-extent threshold with FSL randomise on ABIDE

**Task ID:** STAT-007
**Category:** Statistical Analysis

## Overview

**Objective:** Perform cluster-extent threshold with FSL randomise on ABIDE

**Context:** Use permutation testing with cluster-size inference for robust multiple comparison correction

## Data Source

**Dataset:** ABIDE dataset
**Data Key:** `nilearn.datasets.fetch_abide_pcp`

## Prerequisites

**Required Capabilities:** fsl_randomise_tool; permutation_test

### Tool Installation

```bash
# Tool Setup Instructions

# Neuroimaging tools (available via Neurodesk)
module load fsl/6.0.5

# Verify installation
ml list  # Check loaded modules
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

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Use permutation testing with cluster-size inference for robust multiple comparison correction
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

- [ ] randomise_complete
- [ ] tfce_map_generated

## Required Evidence Files

- [ ] `randomise_tfce_tstat.nii.gz`
- [ ] `cluster_table.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh randomise_tfce_tstat.nii.gz
   ls -lh cluster_table.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: randomise_complete
   - Verify: tfce_map_generated

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
