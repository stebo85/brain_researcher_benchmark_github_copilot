# Detailed Implementation Plan: HARM-007: Apply Neurocombat to harmonize cortical thickness across FreeSurfer datasets

**Task ID:** HARM-007
**Category:** Data Harmonization

## Overview

**Objective:** Apply Neurocombat to harmonize cortical thickness across FreeSurfer datasets

**Context:** Remove site effects from surface-based measures

## Data Source

**Dataset:** Custom FreeSurfer cohort
**Data Key:** ``

## Prerequisites

**Required Capabilities:** data_harmonization_tool; freesurfer_tool

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

# Note: Specific data source not specified. Use appropriate Custom FreeSurfer cohort data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Remove site effects from surface-based measures
   - Apply Neurocombat to harmonize cortical thickness across FreeSurfer datasets

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] thickness_harmonized
- [ ] surface_preserved

## Required Evidence Files

- [ ] `harmonized_thickness.mgh`
- [ ] `qc_report.html`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh harmonized_thickness.mgh
   ls -lh qc_report.html
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: thickness_harmonized
   - Verify: surface_preserved

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
