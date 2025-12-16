# Detailed Implementation Plan: SEG-002: Segment gray matter, white matter, and CSF from ADHD-200 T1w images

**Task ID:** SEG-002
**Category:** Segmentation

## Overview

**Objective:** Segment gray matter, white matter, and CSF from ADHD-200 T1w images

**Context:** Classify each voxel into one of three main tissue types using intensity and spatial priors

## Data Source

**Dataset:** ADHD-200 dataset
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** spm_segment_tool; tissue_classification

### Tool Installation

```bash
# Tool Setup Instructions

# Neuroimaging tools (available via Neurodesk)
module load spm12/12.7219

# Python packages
pip install nibabel nilearn scikit-learn

# Verify installation
ml list  # Check loaded modules
python -c "import nibabel"  # Test Python imports
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
   - Classify each voxel into one of three main tissue types using intensity and spatial priors
   - Segment gray matter, white matter, and CSF from ADHD-200 T1w images

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] tissue_maps_generated
- [ ] probability_sum=1

## Required Evidence Files

- [ ] `c1_gm.nii.gz`
- [ ] `c2_wm.nii.gz`
- [ ] `c3_csf.nii.gz`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh c1_gm.nii.gz
   ls -lh c2_wm.nii.gz
   ls -lh c3_csf.nii.gz
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: tissue_maps_generated
   - Verify: probability_sum=1

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
