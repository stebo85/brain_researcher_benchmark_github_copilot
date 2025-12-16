# Detailed Implementation Plan: CLIN-001: Classify ADHD vs controls using resting-state connectivity features

**Task ID:** CLIN-001
**Category:** Clinical Analysis

## Overview

**Objective:** Classify ADHD vs controls using resting-state connectivity features

**Context:** Build diagnostic classifier from brain network patterns to aid clinical assessment

## Data Source

**Dataset:** ADHD-200 dataset
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** mvpa_tool; clinical_decision_support

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
   - Build diagnostic classifier from brain network patterns to aid clinical assessment
   - Classify ADHD vs controls using resting-state connectivity features

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] balanced_accuracy>0.65
- [ ] auc>0.7

## Required Evidence Files

- [ ] `roc_curve.png`
- [ ] `confusion_matrix.png`
- [ ] `feature_importance.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh roc_curve.png
   ls -lh confusion_matrix.png
   ls -lh feature_importance.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: balanced_accuracy>0.65
   - Verify: auc>0.7

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
