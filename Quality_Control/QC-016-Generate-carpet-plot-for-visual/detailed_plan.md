# Detailed Implementation Plan: QC-016: Generate carpet plot for visual inspection of Brainomics data

**Task ID:** QC-016
**Category:** Quality Control

## Overview

**Objective:** Generate carpet plot for visual inspection of Brainomics data

**Context:** Create comprehensive visualization showing all voxels' timeseries to spot global artifacts

## Data Source

**Dataset:** Brainomics Localizer dataset
**Data Key:** `nilearn.datasets.fetch_localizer_contrasts`

## Prerequisites

**Required Capabilities:** carpet_plot_tool; visual_qc

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
   - Create comprehensive visualization showing all voxels' timeseries to spot global artifacts
   - {user_prompt}

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] carpet_plot_generated
- [ ] artifacts_visible

## Required Evidence Files

- [ ] `carpet_plot.png`
- [ ] `tissue_signals.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh carpet_plot.png
   ls -lh tissue_signals.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: carpet_plot_generated
   - Verify: artifacts_visible

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
