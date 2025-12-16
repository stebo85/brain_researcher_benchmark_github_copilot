# Detailed Implementation Plan: STATINF-009: Compute standardized effect sizes (Cohen's d) for group contrasts

**Task ID:** STATINF-009
**Category:** Statistical Inference

## Overview

**Objective:** Compute standardized effect sizes (Cohen's d) for group contrasts

**Context:** Calculate effect size for ASD vs control differences to assess clinical significance

## Data Source

**Dataset:** ABIDE dataset
**Data Key:** `nilearn.datasets.fetch_abide_pcp`

## Prerequisites

**Required Capabilities:** statistical_inference_tool

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
data = datasets.fetch_abide_pcp(n_subjects=30, pipeline='cpac')
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Calculate effect size for ASD vs control differences to assess clinical significance
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

- [ ] cohens_d_computed
- [ ] effect_sizes>0.5

## Required Evidence Files

- [ ] `effect_sizes.csv`
- [ ] `effect_size_map.nii.gz`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh effect_sizes.csv
   ls -lh effect_size_map.nii.gz
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: cohens_d_computed
   - Verify: effect_sizes>0.5

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
