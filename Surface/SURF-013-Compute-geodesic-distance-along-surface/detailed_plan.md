# Detailed Implementation Plan: SURF-013: Compute geodesic distance along surface between ROIs

**Task ID:** SURF-013
**Category:** Surface

## Overview

**Objective:** Compute geodesic distance along surface between ROIs

**Context:** Measure distances following cortical surface curvature instead of straight-line Euclidean

## Data Source

**Dataset:** Surface mesh + ROIs
**Data Key:** ``

## Prerequisites

**Required Capabilities:** geodesic_distance_tool; surface_metrics

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

# Note: Specific data source not specified. Use appropriate Surface mesh + ROIs data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Measure distances following cortical surface curvature instead of straight-line Euclidean
   - Compute geodesic distance along surface between ROIs

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] distance_matrix_computed
- [ ] surface_paths_found

## Required Evidence Files

- [ ] `geodesic_distances.csv`
- [ ] `shortest_paths.json`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh geodesic_distances.csv
   ls -lh shortest_paths.json
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: distance_matrix_computed
   - Verify: surface_paths_found

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
