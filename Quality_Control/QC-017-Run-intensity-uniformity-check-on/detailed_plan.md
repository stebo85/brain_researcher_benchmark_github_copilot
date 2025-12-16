# Detailed Implementation Plan: QC-017: Run intensity uniformity check on OASIS T1w images

**Task ID:** QC-017
**Category:** Quality Control

## Overview

**Objective:** Run intensity uniformity check on OASIS T1w images

**Context:** Verify consistent brightness across field of view indicating good RF coil performance

## Data Source

**Dataset:** OASIS VBM dataset
**Data Key:** `nilearn.datasets.fetch_oasis_vbm`

## Prerequisites

**Required Capabilities:** uniformity_checker; acquisition_qc

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
data = datasets.fetch_oasis_vbm(n_subjects=50)
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
   - Verify consistent brightness across field of view indicating good RF coil performance
   - Run intensity uniformity check on OASIS T1w images

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] uniformity_assessed
- [ ] coefficient<0.15

## Required Evidence Files

- [ ] `uniformity_map.nii.gz`
- [ ] `uniformity_stats.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh uniformity_map.nii.gz
   ls -lh uniformity_stats.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: uniformity_assessed
   - Verify: coefficient<0.15

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
