# Detailed Implementation Plan: DATA-007: Create dataset splits (train/val/test) for NKI Enhanced cohort

**Task ID:** DATA-007
**Category:** Data Management

## Overview

**Objective:** Create dataset splits (train/val/test) for NKI Enhanced cohort

**Context:** Divide subjects into training, validation and test groups while balancing age and sex distribution

## Data Source

**Dataset:** NKI Enhanced dataset
**Data Key:** `nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki`

## Prerequisites

**Required Capabilities:** data_splitting_tool; stratification

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

1. **Fetch the dataset**
   - Use the specified data key to download data
   - Verify download completion

2. **Validate data structure**
   - Divide subjects into training, validation and test groups while balancing age and sex distribution
   - Check file organization and naming

3. **Verify data integrity**
   - Check for missing files
   - Validate metadata

4. **Generate validation report**
   - Document data structure
   - List any issues found

## Acceptance Criteria

- [ ] splits_created
- [ ] demographics_balanced

## Required Evidence Files

- [ ] `train_subjects.txt`
- [ ] `val_subjects.txt`
- [ ] `test_subjects.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh train_subjects.txt
   ls -lh val_subjects.txt
   ls -lh test_subjects.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: splits_created
   - Verify: demographics_balanced

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
