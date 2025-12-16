# Detailed Implementation Plan: SURF-012: Extract myelin maps from T1w/T2w ratio on cortical surface

**Task ID:** SURF-012
**Category:** Surface

## Overview

**Objective:** Extract myelin maps from T1w/T2w ratio on cortical surface

**Context:** Create cortical myelin content maps by projecting intensity ratios to surface

## Data Source

**Dataset:** T1w + T2w images
**Data Key:** ``

## Prerequisites

**Required Capabilities:** myelin_mapping_tool; surface_projection

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

# Note: Specific data source not specified. Use appropriate T1w + T2w images data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Create cortical myelin content maps by projecting intensity ratios to surface
   - Extract myelin maps from T1w/T2w ratio on cortical surface

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] myelin_map_generated
- [ ] cortical_gradients_visible

## Required Evidence Files

- [ ] `lh_myelin.gii`
- [ ] `rh_myelin.gii`
- [ ] `myelin_plot.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh lh_myelin.gii
   ls -lh rh_myelin.gii
   ls -lh myelin_plot.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: myelin_map_generated
   - Verify: cortical_gradients_visible

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
