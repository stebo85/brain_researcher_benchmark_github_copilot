# Detailed Implementation Plan: SURF-014: Perform surface-based searchlight decoding on task fMRI data

**Task ID:** SURF-014
**Category:** Surface

## Overview

**Objective:** Perform surface-based searchlight decoding on task fMRI data

**Context:** Decode task information from local surface patches while respecting cortical topology

## Data Source

**Dataset:** Surface fMRI + labels
**Data Key:** ``

## Prerequisites

**Required Capabilities:** searchlight_tool; surface_decoding

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

# Note: Specific data source not specified. Use appropriate Surface fMRI + labels data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Decode task information from local surface patches while respecting cortical topology
   - Perform surface-based searchlight decoding on task fMRI data

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] surface_searchlight_map
- [ ] peak_accuracy_identified

## Required Evidence Files

- [ ] `lh_accuracy.gii`
- [ ] `searchlight_peaks.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh lh_accuracy.gii
   ls -lh searchlight_peaks.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: surface_searchlight_map
   - Verify: peak_accuracy_identified

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
