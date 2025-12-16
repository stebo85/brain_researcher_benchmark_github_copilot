# Detailed Implementation Plan: HARM-014: Apply longitudinal ComBat to Development fMRI repeated measures

**Task ID:** HARM-014
**Category:** Data Harmonization

## Overview

**Objective:** Apply longitudinal ComBat to Development fMRI repeated measures

**Context:** Harmonize while preserving within-subject correlation structure

## Data Source

**Dataset:** Development fMRI dataset
**Data Key:** `nilearn.datasets.fetch_development_fmri`

## Prerequisites

**Required Capabilities:** data_harmonization_tool; mixed_effects_tool

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
data = datasets.fetch_development_fmri(n_subjects=30)
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
   - Harmonize while preserving within-subject correlation structure
   - Apply longitudinal ComBat to Development fMRI repeated measures

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] repeated_measures_preserved
- [ ] scanner_drift_removed

## Required Evidence Files

- [ ] `harmonized_longitudinal.npy`
- [ ] `icc_before_after.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh harmonized_longitudinal.npy
   ls -lh icc_before_after.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: repeated_measures_preserved
   - Verify: scanner_drift_removed

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
