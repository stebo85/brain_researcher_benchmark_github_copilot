# Detailed Implementation Plan: HARM-003: Remove scanner effects from Brainomics Localizer using linear mixed models

**Task ID:** HARM-003
**Category:** Data Harmonization

## Overview

**Objective:** Remove scanner effects from Brainomics Localizer using linear mixed models

**Context:** Model scanner as random effect and remove its contribution statistically

## Data Source

**Dataset:** Brainomics Localizer
**Data Key:** `nilearn.datasets.fetch_localizer_contrasts`

## Prerequisites

**Required Capabilities:** mixed_effects_tool; data_harmonization_tool

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
   - Model scanner as random effect and remove its contribution statistically
   - Remove scanner effects from Brainomics Localizer using linear mixed models

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] random_effects_removed
- [ ] fixed_effects_preserved

## Required Evidence Files

- [ ] `harmonized_contrasts.nii.gz`
- [ ] `variance_components.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh harmonized_contrasts.nii.gz
   ls -lh variance_components.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: random_effects_removed
   - Verify: fixed_effects_preserved

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
