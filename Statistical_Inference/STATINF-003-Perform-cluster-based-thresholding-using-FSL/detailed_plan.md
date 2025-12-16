# Detailed Implementation Plan: STATINF-003: Perform cluster-based thresholding using FSL randomise

**Task ID:** STATINF-003
**Category:** Statistical Inference

## Overview

**Objective:** Perform cluster-based thresholding using FSL randomise

**Context:** Define significant brain regions using cluster extent instead of individual voxels

## Data Source

**Dataset:** Localizer contrasts
**Data Key:** ``

## Prerequisites

**Required Capabilities:** fsl_palm_tool; cluster_correction

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

# Note: Specific data source not specified. Use appropriate Localizer contrasts data.


## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Define significant brain regions using cluster extent instead of individual voxels
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

- [ ] cluster_map
- [ ] cluster_table

## Required Evidence Files

- [ ] `corrected_clusters.nii.gz`
- [ ] `cluster_stats.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh corrected_clusters.nii.gz
   ls -lh cluster_stats.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: cluster_map
   - Verify: cluster_table

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
