# Detailed Implementation Plan: ELEC-009: Perform automatic bad channel detection using autoreject on epochs

**Task ID:** ELEC-009
**Category:** Electrophysiology

## Overview

**Objective:** Perform automatic bad channel detection using autoreject on epochs

**Context:** Automatically identify and mark problematic MEG sensors that have excessive noise or artifacts

## Data Source

**Dataset:** MNE sample dataset
**Data Key:** `mne.datasets.sample.data_path()`

## Prerequisites

**Required Capabilities:** mne_autoreject_tool; quality_control

### Tool Installation

```bash
# Required tools and libraries
```

## Step 1: Data Acquisition

# Data source: mne.datasets.sample.data_path()
# Follow standard procedures to obtain MNE sample dataset

## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Automatically identify and mark problematic MEG sensors that have excessive noise or artifacts
   - {user_prompt}

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] bad_channels_detected
- [ ] rejection_threshold_computed

## Required Evidence Files

- [ ] `autoreject_log.pkl`
- [ ] `bad_channels.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh autoreject_log.pkl
   ls -lh bad_channels.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: bad_channels_detected
   - Verify: rejection_threshold_computed

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
