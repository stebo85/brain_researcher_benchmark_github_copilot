# Detailed Implementation Plan: STAT-016: Apply small volume correction for amygdala ROI in Mixed Gambles

**Task ID:** STAT-016
**Category:** Statistical Analysis

## Overview

**Objective:** Apply small volume correction for amygdala ROI in Mixed Gambles

**Context:** Restrict multiple comparison correction to anatomically defined search volume

## Data Source

**Dataset:** Mixed gambles dataset
**Data Key:** `nilearn.datasets.fetch_mixed_gambles`

## Prerequisites

**Required Capabilities:** svc_tool; roi_correction

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

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Restrict multiple comparison correction to anatomically defined search volume
   - Define design matrix and contrasts

3. **Perform statistical analysis**
   - Fit the model to data
   - Compute test statistics
   - Apply multiple comparison corrections

4. **Generate statistical maps**
   - Create thresholded maps
   - Identify significant clusters

5. **Save statistical results**
   - Export statistical maps
   - Save cluster information and statistics

## Acceptance Criteria

- [ ] svc_applied
- [ ] corrected_within_roi

## Required Evidence Files

- [ ] `svc_corrected_map.nii.gz`
- [ ] `peak_coordinates.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh svc_corrected_map.nii.gz
   ls -lh peak_coordinates.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: svc_applied
   - Verify: corrected_within_roi

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
