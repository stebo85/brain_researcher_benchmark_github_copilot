# Detailed Implementation Plan: META-020: Extract study quality metrics and run quality-weighted meta-analysis

**Task ID:** META-020
**Category:** Meta-Analysis

## Overview

**Objective:** Extract study quality metrics and run quality-weighted meta-analysis

**Context:** Weight studies by methodological quality when pooling activation coordinates

## Data Source

**Dataset:** Rated studies coordinates
**Data Key:** ``

## Prerequisites

**Required Capabilities:** literature_mining_tool; coordinate_meta_analysis_tool

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

# Note: Specific data source not specified. Use appropriate Rated studies coordinates data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Weight studies by methodological quality when pooling activation coordinates
   - Extract study quality metrics and run quality-weighted meta-analysis

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] quality_scores_assigned
- [ ] quality_weighted_ale

## Required Evidence Files

- [ ] `quality_weighted.nii.gz`
- [ ] `quality_distribution.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh quality_weighted.nii.gz
   ls -lh quality_distribution.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: quality_scores_assigned
   - Verify: quality_weighted_ale

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
