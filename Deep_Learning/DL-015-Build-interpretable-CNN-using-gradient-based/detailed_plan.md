# Detailed Implementation Plan: DL-015: Build interpretable CNN using gradient-based saliency maps

**Task ID:** DL-015
**Category:** Deep Learning

## Overview

**Objective:** Build interpretable CNN using gradient-based saliency maps

**Context:** Compute gradients to identify which input features most influence predictions

## Data Source

**Dataset:** ADHD-200
**Data Key:** `nilearn.datasets.fetch_adhd`

## Prerequisites

**Required Capabilities:** interpretability_tool; saliency_maps

### Tool Installation

```bash
# Tool Setup Instructions

# Install required tools based on task requirements
# Use 'ml av' to see available Neurodesk modules
# Use 'pip install <package>' for Python packages

# Verify installation
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

1. **Prepare the dataset**
   - Load 3D/4D neuroimaging data
   - Normalize voxel intensities
   - Create data loaders for batching

2. **Define the neural network architecture**
   - Compute gradients to identify which input features most influence predictions
   - Set appropriate input dimensions
   - Define loss function and optimizer

3. **Train the deep learning model**
   - Implement training loop with validation
   - Monitor loss and accuracy on validation set
   - Save checkpoints during training

4. **Evaluate on test set**
   - Load best checkpoint
   - Calculate test metrics
   - Generate learning curves

5. **Save model and training artifacts**
   - Save final model weights
   - Export training history and plots

## Acceptance Criteria

- [ ] saliency_maps_generated
- [ ] discriminative_regions_found

## Required Evidence Files

- [ ] `saliency_examples.nii.gz`
- [ ] `region_importance.csv`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh saliency_examples.nii.gz
   ls -lh region_importance.csv
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: saliency_maps_generated
   - Verify: discriminative_regions_found

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
