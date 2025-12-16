# Detailed Implementation Plan: SURF-017: Extract white matter surface and compute WM-GM contrast

**Task ID:** SURF-017
**Category:** Surface

## Overview

**Objective:** Extract white matter surface and compute WM-GM contrast

**Context:** Calculate contrast between white and gray matter intensities at cortical boundary

## Data Source

**Dataset:** FreeSurfer surfaces
**Data Key:** ``

## Prerequisites

**Required Capabilities:** freesurfer_tool; wm_gm_contrast

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

# Note: Specific data source not specified. Use appropriate FreeSurfer surfaces data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Calculate contrast between white and gray matter intensities at cortical boundary
   - Extract white matter surface and compute WM-GM contrast

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] wm_surface_generated
- [ ] contrast_map_computed

## Required Evidence Files

- [ ] `lh.white`
- [ ] `wm_gm_contrast.gii`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh lh.white
   ls -lh wm_gm_contrast.gii
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: wm_surface_generated
   - Verify: contrast_map_computed

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
