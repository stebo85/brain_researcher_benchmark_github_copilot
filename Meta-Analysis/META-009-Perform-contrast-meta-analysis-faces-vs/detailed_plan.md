# Detailed Implementation Plan: META-009: Perform contrast meta-analysis: faces vs houses across studies

**Task ID:** META-009
**Category:** Meta-Analysis

## Overview

**Objective:** Perform contrast meta-analysis: faces vs houses across studies

**Context:** Meta-analyze the differential activation between two stimulus types

## Data Source

**Dataset:** Category-specific coordinates
**Data Key:** ``

## Prerequisites

**Required Capabilities:** coordinate_meta_analysis_tool

### Tool Installation

```bash
# Tool Setup Instructions

# Install required tools based on task requirements
# Use 'ml av' to see available Neurodesk modules
# Use 'pip install <package>' for Python packages

# Verify installation
```

## Step 1: Data Acquisition

# Note: Specific data source not specified. Use appropriate Category-specific coordinates data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Meta-analyze the differential activation between two stimulus types
   - Perform contrast meta-analysis: faces vs houses across studies

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] contrast_ale_map
- [ ] conjunction_analysis

## Required Evidence Files

- [ ] `contrast_map.nii.gz`
- [ ] `conjunction_map.nii.gz`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh contrast_map.nii.gz
   ls -lh conjunction_map.nii.gz
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: contrast_ale_map
   - Verify: conjunction_analysis

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
