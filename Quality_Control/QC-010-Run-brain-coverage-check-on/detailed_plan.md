# Detailed Implementation Plan: QC-010: Run brain coverage check on Mixed Gambles acquisition

**Task ID:** QC-010
**Category:** Quality Control

## Overview

**Objective:** Run brain coverage check on Mixed Gambles acquisition

**Context:** Verify that field of view includes all relevant brain regions without cutoff

## Data Source

**Dataset:** Mixed gambles dataset
**Data Key:** `nilearn.datasets.fetch_mixed_gambles`

## Prerequisites

**Required Capabilities:** coverage_checker; acquisition_qc

### Tool Installation and Setup

This analysis requires the following tools:

#### Required Tools

The specific tools needed are listed in the **Required Capabilities** section above.

```bash
# Search for available tools in Neurodesk
ml av  # List all available modules
ml av <toolname>  # Search for specific tool

# Load required tools
module load <toolname>/<version>

# Install Python packages if needed
pip install <package-name>
```

#### Environment Verification

```bash
# Verify all tools are accessible

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
data = datasets.fetch_mixed_gambles()
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
   - Verify that field of view includes all relevant brain regions without cutoff
   - Run brain coverage check on Mixed Gambles acquisition

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] coverage_verified
- [ ] no_cutoff

## Required Evidence Files

- [ ] `coverage_map.nii.gz`
- [ ] `coverage_report.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh coverage_map.nii.gz
   ls -lh coverage_report.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: coverage_verified
   - Verify: no_cutoff

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
