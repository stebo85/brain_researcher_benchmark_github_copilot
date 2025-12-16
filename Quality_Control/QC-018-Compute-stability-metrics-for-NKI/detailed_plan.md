# Detailed Implementation Plan: QC-018: Compute stability metrics for NKI test-retest subjects

**Task ID:** QC-018
**Category:** Quality Control

## Overview

**Objective:** Compute stability metrics for NKI test-retest subjects

**Context:** Measure how consistent brain activations are across multiple scanning sessions

## Data Source

**Dataset:** NKI Enhanced dataset
**Data Key:** `nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki`

## Prerequisites

**Required Capabilities:** reliability_tool; retest_qc

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
data = datasets.fetch_surf_nki_enhanced(n_subjects=10)
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
   - Measure how consistent brain activations are across multiple scanning sessions
   - Compute stability metrics for NKI test-retest subjects

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] icc_computed
- [ ] stability_high

## Required Evidence Files

- [ ] `reliability_metrics.csv`
- [ ] `icc_maps.nii.gz`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh reliability_metrics.csv
   ls -lh icc_maps.nii.gz
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: icc_computed
   - Verify: stability_high

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
