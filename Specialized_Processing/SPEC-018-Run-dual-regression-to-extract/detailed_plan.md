# Detailed Implementation Plan: SPEC-018: Run dual regression to extract subject-specific spatial maps

**Task ID:** SPEC-018
**Category:** Specialized Processing

## Overview

**Objective:** Run dual regression to extract subject-specific spatial maps

**Context:** Back-project group ICA maps to individual subjects

## Data Source

**Dataset:** Development fMRI dataset
**Data Key:** `nilearn.datasets.fetch_development_fmri`

## Prerequisites

**Required Capabilities:** specialized_processing_tool; connectivity_tool

### Tool Installation

```bash
# Tool Setup Instructions

# Python packages
pip install nibabel scipy nilearn

# Verify installation
python -c "import nibabel"  # Test Python imports
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
   - Back-project group ICA maps to individual subjects
   - Run dual regression to extract subject-specific spatial maps

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] subject_maps_extracted
- [ ] individual_timeseries_generated

## Required Evidence Files

- [ ] `subject_spatial_maps/`
- [ ] `subject_timeseries.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh subject_spatial_maps/
   ls -lh subject_timeseries.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: subject_maps_extracted
   - Verify: individual_timeseries_generated

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
