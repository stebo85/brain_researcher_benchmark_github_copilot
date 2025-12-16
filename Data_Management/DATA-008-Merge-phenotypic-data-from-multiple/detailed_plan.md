# Detailed Implementation Plan: DATA-008: Merge phenotypic data from multiple ADHD-200 sites

**Task ID:** DATA-008
**Category:** Data Management

## Overview

**Objective:** Merge phenotypic data from multiple ADHD-200 sites

**Context:** Combine participant information from different scanning locations into one unified table

## Data Source

**Dataset:** ADHD-200 dataset
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** data_merge_tool; harmonization

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

1. **Fetch the dataset**
   - Use the specified data key to download data
   - Verify download completion

2. **Validate data structure**
   - Combine participant information from different scanning locations into one unified table
   - Check file organization and naming

3. **Verify data integrity**
   - Check for missing files
   - Validate metadata

4. **Generate validation report**
   - Document data structure
   - List any issues found

## Acceptance Criteria

- [ ] merge_complete
- [ ] site_encoded

## Required Evidence Files

- [ ] `merged_phenotypes.csv`
- [ ] `site_mapping.json`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh merged_phenotypes.csv
   ls -lh site_mapping.json
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: merge_complete
   - Verify: site_encoded

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
