# Detailed Implementation Plan: HARM-002: Harmonize ADHD-200 multisite data using Traveling Subject method

**Task ID:** HARM-002
**Category:** Data Harmonization

## Overview

**Objective:** Harmonize ADHD-200 multisite data using Traveling Subject method

**Context:** Use traveling subjects to model and remove site-specific biases

## Data Source

**Dataset:** ADHD-200 dataset
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** data_harmonization_tool

### Tool Installation

```bash
# Tool Setup Instructions

# Install required tools based on task requirements
# Use 'ml av' to see available Neurodesk modules
# Use 'pip install <package>' for Python packages

# Verify installation
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
   - Use traveling subjects to model and remove site-specific biases
   - Harmonize ADHD-200 multisite data using Traveling Subject method

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] scanner_effects_modeled
- [ ] harmonization_validated

## Required Evidence Files

- [ ] `harmonized_subjects/`
- [ ] `validation_metrics.json`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh harmonized_subjects/
   ls -lh validation_metrics.json
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: scanner_effects_modeled
   - Verify: harmonization_validated

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
