# Detailed Implementation Plan: SURF-016: Compute surface area expansion/contraction from longitudinal scans

**Task ID:** SURF-016
**Category:** Surface

## Overview

**Objective:** Compute surface area expansion/contraction from longitudinal scans

**Context:** Measure local changes in cortical surface area over time to detect atrophy or growth

## Data Source

**Dataset:** Longitudinal FreeSurfer
**Data Key:** ``

## Prerequisites

**Required Capabilities:** longitudinal_freesurfer; surface_change

### Tool Installation and Setup

This analysis requires the following tools:

#### Neuroimaging Software (via Neurodesk)

**FREESURFER 7.3.2**
- **Purpose**: FreeSurfer for cortical surface reconstruction and analysis
- **Usage**: Use for surface-based morphometry and cortical parcellation
- **Loading**: Available through Neurodesk's module system

```bash
# Load freesurfer from Neurodesk
module load freesurfer/7.3.2

# Verify freesurfer is loaded
ml list

# Check freesurfer commands are available
which recon-all
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

# Note: Specific data source not specified. Use appropriate Longitudinal FreeSurfer data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Measure local changes in cortical surface area over time to detect atrophy or growth
   - Compute surface area expansion/contraction from longitudinal scans

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] surface_change_map
- [ ] annual_percent_change

## Required Evidence Files

- [ ] `lh_area_change.gii`
- [ ] `longitudinal_stats.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh lh_area_change.gii
   ls -lh longitudinal_stats.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: surface_change_map
   - Verify: annual_percent_change

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
