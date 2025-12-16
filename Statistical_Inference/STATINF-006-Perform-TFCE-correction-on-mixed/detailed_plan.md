# Detailed Implementation Plan: STATINF-006: Perform TFCE correction on mixed effects GLM results

**Task ID:** STATINF-006
**Category:** Statistical Inference

## Overview

**Objective:** Perform TFCE correction on mixed effects GLM results

**Context:** Use threshold-free cluster enhancement to avoid arbitrary cluster-forming threshold

## Data Source

**Dataset:** Development fMRI dataset
**Data Key:** `nilearn.datasets.fetch_development_fmri`

## Prerequisites

**Required Capabilities:** statistical_inference_tool; fsl_palm_tool

### Tool Installation and Setup

This analysis requires the following tools:

#### Neuroimaging Software (via Neurodesk)

**FSL 6.0.5**
- **Purpose**: FSL (FMRIB Software Library) provides tools for fMRI, MRI and DTI analysis
- **Usage**: Use for brain extraction, registration, preprocessing, and analysis
- **Loading**: Available through Neurodesk's module system

```bash
# Load fsl from Neurodesk
module load fsl/6.0.5

# Verify fsl is loaded
ml list

# Check fsl commands are available
which fsl
```

#### Environment Verification

```bash
# Verify all tools are accessible
ml list  # Should show loaded modules

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
data = datasets.fetch_development_fmri(n_subjects=30)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Use threshold-free cluster enhancement to avoid arbitrary cluster-forming threshold
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

- [ ] tfce_corrected_map
- [ ] enhanced_sensitivity

## Required Evidence Files

- [ ] `tfce_map.nii.gz`
- [ ] `corrected_pvals.nii.gz`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh tfce_map.nii.gz
   ls -lh corrected_pvals.nii.gz
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: tfce_corrected_map
   - Verify: enhanced_sensitivity

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
