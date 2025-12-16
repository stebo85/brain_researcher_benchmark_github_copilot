# Detailed Implementation Plan: STATINF-008: Apply Bonferroni correction to ROI-based analysis

**Task ID:** STATINF-008
**Category:** Statistical Inference

## Overview

**Objective:** Apply Bonferroni correction to ROI-based analysis

**Context:** Use conservative family-wise error correction for small number of tests

## Data Source

**Dataset:** Haxby with 10 ROIs
**Data Key:** ``

## Prerequisites

**Required Capabilities:** multiple_comparison_tool

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

# Note: Specific data source not specified. Use appropriate Haxby with 10 ROIs data.


## Step 2: Implementation Steps

1. **Load the analysis data**
   - Read statistical maps or data matrices
   - Verify data structure

2. **Set up the statistical model**
   - Use conservative family-wise error correction for small number of tests
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

- [ ] bonferroni_alpha=0.005
- [ ] surviving_rois

## Required Evidence Files

- [ ] `roi_results.csv`
- [ ] `corrected_pvals.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh roi_results.csv
   ls -lh corrected_pvals.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: bonferroni_alpha=0.005
   - Verify: surviving_rois

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
