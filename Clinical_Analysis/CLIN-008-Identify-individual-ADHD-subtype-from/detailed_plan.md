# Detailed Implementation Plan: CLIN-008: Identify individual ADHD subtype from brain connectivity fingerprint

**Task ID:** CLIN-008
**Category:** Clinical Analysis

## Overview

**Objective:** Identify individual ADHD subtype from brain connectivity fingerprint

**Context:** Classify inattentive vs hyperactive vs combined ADHD subtypes from neural data

## Data Source

**Dataset:** ADHD-200 dataset
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** connectivity_tool; mvpa_tool

### Tool Installation

```bash
# Required tools and libraries
pip install nilearn nibabel scipy
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_adhd(n_subjects=30)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Classify inattentive vs hyperactive vs combined ADHD subtypes from neural data
   - {user_prompt}

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] 3class_accuracy>0.6
- [ ] subtype_signatures

## Required Evidence Files

- [ ] `subtype_classifier.pkl`
- [ ] `connectivity_signatures.npy`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh subtype_classifier.pkl
   ls -lh connectivity_signatures.npy
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: 3class_accuracy>0.6
   - Verify: subtype_signatures

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
