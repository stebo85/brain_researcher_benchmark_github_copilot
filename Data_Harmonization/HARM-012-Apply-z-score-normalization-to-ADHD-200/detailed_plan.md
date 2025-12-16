# Detailed Implementation Plan: HARM-012: Apply z-score normalization to ADHD-200 within-scanner batches

**Task ID:** HARM-012
**Category:** Data Harmonization

## Overview

**Objective:** Apply z-score normalization to ADHD-200 within-scanner batches

**Context:** Standardize signal intensity within each scanner separately

## Data Source

**Dataset:** ADHD-200 dataset
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** data_harmonization_tool

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
data = datasets.fetch_adhd(n_subjects=30)
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
   - Standardize signal intensity within each scanner separately
   - Apply z-score normalization to ADHD-200 within-scanner batches

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] within_scanner_normalized
- [ ] between_scanner_preserved

## Required Evidence Files

- [ ] `normalized_data.npy`
- [ ] `normalization_params.json`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh normalized_data.npy
   ls -lh normalization_params.json
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: within_scanner_normalized
   - Verify: between_scanner_preserved

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
