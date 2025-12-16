# Detailed Implementation Plan: SURF-008: Extract vertex-wise statistical maps comparing cortical thickness across groups

**Task ID:** SURF-008
**Category:** Surface

## Overview

**Objective:** Extract vertex-wise statistical maps comparing cortical thickness across groups

**Context:** Test every surface vertex for group differences in thickness while controlling for multiple comparisons

## Data Source

**Dataset:** FreeSurfer multi-subject
**Data Key:** ``

## Prerequisites

**Required Capabilities:** surface_statistics_tool; vertex_wise_analysis

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

# Note: Specific data source not specified. Use appropriate FreeSurfer multi-subject data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Test every surface vertex for group differences in thickness while controlling for multiple comparisons
   - Extract vertex-wise statistical maps comparing cortical thickness across groups

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] vertex_pvalues_computed
- [ ] cluster_corrected

## Required Evidence Files

- [ ] `thickness_pvals.gii`
- [ ] `significant_clusters.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh thickness_pvals.gii
   ls -lh significant_clusters.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: vertex_pvalues_computed
   - Verify: cluster_corrected

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
