# Detailed Implementation Plan: WORK-008: Run quality control workflow: MRIQC on all subjects, flag outliers, generate report

**Task ID:** WORK-008
**Category:** Workflow

## Overview

**Objective:** Run quality control workflow: MRIQC on all subjects, flag outliers, generate report

**Context:** Automated QC pipeline with outlier detection across multiple subjects

## Data Source

**Dataset:** ADHD-200 dataset
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** mriqc_tool; qc_tools

### Tool Installation and Setup

This analysis requires the following tools:

#### Container-Based Tools

**MRIQC 23.1.0**
- **Purpose**: Automated quality control for MRI
- **Usage**: Generate quality metrics and visual reports for anatomical and functional scans
- **Access**: Available through Neurodesk or Singularity/Docker

```bash
# Option 1: Use via Neurodesk (recommended)
# Check if mriqc container is available in Neurodesk
ls /cvmfs/neurodesk.ardc.edu.au/containers/mriqc*/

# Option 2: Pull container directly
singularity pull docker://nipreps/mriqc:23.1.0

# Run mriqc
singularity run mriqc_23.1.0.sif --help
```

#### Environment Verification

```bash
# Verify all tools are accessible

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
data = datasets.fetch_adhd(n_subjects=30)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Set up the workflow environment**
   - Ensure all required tools are installed
   - Create output directories

2. **Configure the pipeline**
   - Automated QC pipeline with outlier detection across multiple subjects
   - Set parameters for each processing step

3. **Execute the workflow**
   - Run the complete pipeline
   - Monitor progress and logs

4. **Validate outputs**
   - Check that all expected outputs are generated
   - Verify output quality

5. **Generate summary report**
   - Document pipeline execution
   - Summarize results

## Acceptance Criteria

- [ ] all_subjects_qc
- [ ] outliers_flagged

## Required Evidence Files

- [ ] `mriqc_group.html`
- [ ] `outliers.txt`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh mriqc_group.html
   ls -lh outliers.txt
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: all_subjects_qc
   - Verify: outliers_flagged

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
