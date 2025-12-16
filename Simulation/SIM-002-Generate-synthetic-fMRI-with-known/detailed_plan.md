# Detailed Implementation Plan: SIM-002: Generate synthetic fMRI with known ground truth activations

**Task ID:** SIM-002
**Category:** Simulation

## Overview

**Objective:** Generate synthetic fMRI with known ground truth activations

**Context:** Create artificial data where true activation locations are known for testing

## Data Source

**Dataset:** Brainomics paradigm
**Data Key:** ``

## Prerequisites

**Required Capabilities:** brain_simulation_tool

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

# Note: Specific data source not specified. Use appropriate Brainomics paradigm data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Create artificial data where true activation locations are known for testing
   - Generate synthetic fMRI with known ground truth activations

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] synthetic_bold_generated
- [ ] snr_controlled

## Required Evidence Files

- [ ] `synthetic_fmri.nii.gz`
- [ ] `ground_truth_mask.nii.gz`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh synthetic_fmri.nii.gz
   ls -lh ground_truth_mask.nii.gz
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: synthetic_bold_generated
   - Verify: snr_controlled

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
