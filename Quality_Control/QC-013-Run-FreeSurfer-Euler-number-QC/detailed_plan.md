# Detailed Implementation Plan: QC-013: Run FreeSurfer Euler number QC on ABIDE structural reconstructions

**Task ID:** QC-013
**Category:** Quality Control

## Overview

**Objective:** Run FreeSurfer Euler number QC on ABIDE structural reconstructions

**Context:** Check surface reconstruction quality using topological defect count

## Data Source

**Dataset:** ABIDE dataset
**Data Key:** `nilearn.datasets.fetch_abide_pcp`

## Prerequisites

**Required Capabilities:** freesurfer_qc_tool; surface_checker

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

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_abide_pcp(n_subjects=30, pipeline='cpac')
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
   - Check surface reconstruction quality using topological defect count
   - Run FreeSurfer Euler number QC on ABIDE structural reconstructions

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] euler_numbers_computed
- [ ] threshold<-200

## Required Evidence Files

- [ ] `euler_summary.csv`
- [ ] `failed_recons.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh euler_summary.csv
   ls -lh failed_recons.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: euler_numbers_computed
   - Verify: threshold<-200

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
