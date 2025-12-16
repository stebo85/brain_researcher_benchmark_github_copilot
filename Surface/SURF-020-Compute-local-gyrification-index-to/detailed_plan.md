# Detailed Implementation Plan: SURF-020: Compute local gyrification index to measure cortical folding complexity

**Task ID:** SURF-020
**Category:** Surface

## Overview

**Objective:** Compute local gyrification index to measure cortical folding complexity

**Context:** Quantify how folded the cortex is by comparing surface area to outer hull area

## Data Source

**Dataset:** FreeSurfer surfaces
**Data Key:** ``

## Prerequisites

**Required Capabilities:** gyrification_tool; surface_metrics

### Tool Installation

```bash
# Tool Setup Instructions

# Install required tools based on task requirements
# Use 'ml av' to see available Neurodesk modules
# Use 'pip install <package>' for Python packages

# Verify installation
```

## Step 1: Data Acquisition

# Note: Specific data source not specified. Use appropriate FreeSurfer surfaces data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Quantify how folded the cortex is by comparing surface area to outer hull area
   - Compute local gyrification index to measure cortical folding complexity

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] lgi_computed
- [ ] folding_complexity_measured

## Required Evidence Files

- [ ] `lh.pial_lgi`
- [ ] `lgi_stats.csv`
- [ ] `lgi_map.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh lh.pial_lgi
   ls -lh lgi_stats.csv
   ls -lh lgi_map.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: lgi_computed
   - Verify: folding_complexity_measured

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
