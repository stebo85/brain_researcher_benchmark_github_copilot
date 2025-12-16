# Detailed Implementation Plan: SPEC-004: Run anatomical CompCor to extract physiological noise from Localizer data

**Task ID:** SPEC-004
**Category:** Specialized Processing

## Overview

**Objective:** Run anatomical CompCor to extract physiological noise from Localizer data

**Context:** Extract principal components from white matter and CSF for denoising

## Data Source

**Dataset:** Brainomics Localizer
**Data Key:** `nilearn.datasets.fetch_localizer_contrasts`

## Prerequisites

**Required Capabilities:** specialized_processing_tool; nilearn_glm_tool

### Tool Installation

```bash
# Required tools and libraries
pip install nilearn nibabel scikit-learn
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_localizer_contrasts()
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
   - Extract principal components from white matter and CSF for denoising
   - Run anatomical CompCor to extract physiological noise from Localizer data

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] compcor_regressors_extracted
- [ ] variance_explained>0.5

## Required Evidence Files

- [ ] `compcor_regressors.csv`
- [ ] `variance_explained.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh compcor_regressors.csv
   ls -lh variance_explained.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: compcor_regressors_extracted
   - Verify: variance_explained>0.5

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
