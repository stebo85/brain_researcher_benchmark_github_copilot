# Detailed Implementation Plan: META-004: Run random effects meta-analysis on language activation maps

**Task ID:** META-004
**Category:** Meta-Analysis

## Overview

**Objective:** Run random effects meta-analysis on language activation maps

**Context:** Account for between-study variability when combining language task results

## Data Source

**Dataset:** NeuroVault language collection
**Data Key:** ``

## Prerequisites

**Required Capabilities:** image_based_meta_analysis_tool

### Tool Installation

```bash
# Required tools and libraries
```

## Step 1: Data Acquisition

# Note: Specific data source not specified. Use appropriate NeuroVault language collection data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Account for between-study variability when combining language task results
   - Run random effects meta-analysis on language activation maps

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] random_effects_map
- [ ] heterogeneity_i2

## Required Evidence Files

- [ ] `meta_zmap.nii.gz`
- [ ] `forest_plot.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh meta_zmap.nii.gz
   ls -lh forest_plot.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: random_effects_map
   - Verify: heterogeneity_i2

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
