# Detailed Implementation Plan: REG-010: Perform inverse normalization to bring MNI results back to native space for Miyawaki

**Task ID:** REG-010
**Category:** Registration

## Overview

**Objective:** Perform inverse normalization to bring MNI results back to native space for Miyawaki

**Context:** Apply reverse transformation to project group results onto individual's original brain

## Data Source

**Dataset:** Miyawaki dataset
**Data Key:** `nilearn.datasets.fetch_miyawaki2008`

## Prerequisites

**Required Capabilities:** inverse_warp_tool; native_space_projection

### Tool Installation

```bash
# Required tools and libraries
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

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Apply reverse transformation to project group results onto individual's original brain
   - {user_prompt}

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] inverse_complete
- [ ] native_space_results

## Required Evidence Files

- [ ] `native_space_results.nii.gz`
- [ ] `inverse_warp.nii.gz`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh native_space_results.nii.gz
   ls -lh inverse_warp.nii.gz
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: inverse_complete
   - Verify: native_space_results

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
