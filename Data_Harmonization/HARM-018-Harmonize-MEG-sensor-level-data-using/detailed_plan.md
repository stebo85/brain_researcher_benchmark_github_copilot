# Detailed Implementation Plan: HARM-018: Harmonize MEG sensor-level data using reference site method

**Task ID:** HARM-018
**Category:** Data Harmonization

## Overview

**Objective:** Harmonize MEG sensor-level data using reference site method

**Context:** Calibrate MEG signals using external reference sensors

## Data Source

**Dataset:** MNE sample dataset
**Data Key:** ``

## Prerequisites

**Required Capabilities:** data_harmonization_tool; mne_preprocessing_tool

### Tool Installation

```bash
# Tool Setup Instructions

# Python packages
pip install mne

# Verify installation
python -c "import mne"  # Test Python imports
```

## Step 1: Data Acquisition

# Note: Specific data source not specified. Use appropriate MNE sample dataset data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Calibrate MEG signals using external reference sensors
   - Harmonize MEG sensor-level data using reference site method

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] sensors_calibrated
- [ ] noise_covariance_normalized

## Required Evidence Files

- [ ] `harmonized_raw.fif`
- [ ] `calibration_factors.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh harmonized_raw.fif
   ls -lh calibration_factors.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: sensors_calibrated
   - Verify: noise_covariance_normalized

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
