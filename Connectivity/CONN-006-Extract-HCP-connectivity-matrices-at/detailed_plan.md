# Detailed Implementation Plan: CONN-006: Extract HCP connectivity matrices at 200-parcel resolution for age prediction

**Task ID:** CONN-006
**Category:** Connectivity

## Overview

**Objective:** Extract HCP connectivity matrices at 200-parcel resolution for age prediction

**Context:** Get connectivity data from 461 subjects using 200 brain regions to train age prediction models

## Data Source

**Dataset:** HCP MegaTrawls
**Data Key:** `nilearn.datasets.fetch_megatrawls_netmats`

## Prerequisites

**Required Capabilities:** connectivity_tool; hcp_data_loader

### Tool Installation and Setup

This analysis requires the following tools:

#### Python Packages

**Connectivity**
- **Purpose**: Tools for functional connectivity analysis
- **Usage**: Use for computing correlation matrices and network analysis

```bash
# Install Python packages
pip install nilearn scipy nibabel

# Verify installation
python -c "import nilearn; print('Successfully imported')"
```

#### Environment Verification

```bash
# Verify all tools are accessible
python -c "import nilearn"  # Should complete without error

# Check system resources
free -h  # Check available memory
df -h .  # Check available disk space
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_megatrawls_netmats()
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load preprocessed fMRI data**
   - Read time series data
   - Verify data quality

2. **Extract ROI time series**
   - Get connectivity data from 461 subjects using 200 brain regions to train age prediction models
   - Use specified atlas for parcellation
   - Extract mean time series from each ROI

3. **Compute connectivity matrix**
   - Calculate Pearson correlation between ROI time series
   - Apply Fisher z-transformation

4. **Perform group-level analysis**
   - Compare connectivity between groups if applicable
   - Apply statistical tests

5. **Save connectivity results**
   - Export connectivity matrices
   - Save statistical comparison results

## Acceptance Criteria

- [ ] 200x200_matrices_extracted
- [ ] n_subjects=461

## Required Evidence Files

- [ ] `connectivity_matrices.h5`
- [ ] `subject_metadata.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh connectivity_matrices.h5
   ls -lh subject_metadata.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: 200x200_matrices_extracted
   - Verify: n_subjects=461

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
