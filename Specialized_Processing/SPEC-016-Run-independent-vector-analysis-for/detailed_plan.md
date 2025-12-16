# Detailed Implementation Plan: SPEC-016: Run independent vector analysis for group ICA with linked components

**Task ID:** SPEC-016
**Category:** Specialized Processing

## Overview

**Objective:** Run independent vector analysis for group ICA with linked components

**Context:** Perform group ICA maintaining subject-specific variation

## Data Source

**Dataset:** ABIDE dataset
**Data Key:** `nilearn.datasets.fetch_abide_pcp`

## Prerequisites

**Required Capabilities:** specialized_processing_tool; fsl_melodic_tool

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
data = datasets.fetch_abide_pcp(n_subjects=30, pipeline='cpac')
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
   - Perform group ICA maintaining subject-specific variation
   - Run independent vector analysis for group ICA with linked components

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] group_components_linked
- [ ] subject_variation_preserved

## Required Evidence Files

- [ ] `iva_components.nii.gz`
- [ ] `subject_loadings.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh iva_components.nii.gz
   ls -lh subject_loadings.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: group_components_linked
   - Verify: subject_variation_preserved

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
