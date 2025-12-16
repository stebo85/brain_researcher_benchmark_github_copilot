# Detailed Implementation Plan: HARM-009: Use propensity score matching to balance ABIDE demographic confounds

**Task ID:** HARM-009
**Category:** Data Harmonization

## Overview

**Objective:** Use propensity score matching to balance ABIDE demographic confounds

**Context:** Create matched ASD/control groups balanced on age, sex, IQ

## Data Source

**Dataset:** ABIDE dataset
**Data Key:** `nilearn.datasets.fetch_abide_pcp`

## Prerequisites

**Required Capabilities:** data_harmonization_tool; statistical_inference_tool

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
data = datasets.fetch_abide_pcp(n_subjects=30, pipeline='cpac')
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
   - Create matched ASD/control groups balanced on age, sex, IQ
   - Use propensity score matching to balance ABIDE demographic confounds

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] groups_balanced
- [ ] confounds_controlled

## Required Evidence Files

- [ ] `matched_subjects.csv`
- [ ] `balance_diagnostics.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh matched_subjects.csv
   ls -lh balance_diagnostics.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: groups_balanced
   - Verify: confounds_controlled

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
