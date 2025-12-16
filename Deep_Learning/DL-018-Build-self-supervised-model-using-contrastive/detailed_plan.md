# Detailed Implementation Plan: DL-018: Build self-supervised model using contrastive learning on unlabeled fMRI

**Task ID:** DL-018
**Category:** Deep Learning

## Overview

**Objective:** Build self-supervised model using contrastive learning on unlabeled fMRI

**Context:** Learn representations by contrasting augmented views without requiring labels

## Data Source

**Dataset:** NKI Enhanced (unlabeled)
**Data Key:** `nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki`

## Prerequisites

**Required Capabilities:** contrastive_learning_tool; self_supervised

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
data = datasets.fetch_surf_nki_enhanced(n_subjects=10)
print(f'Data downloaded to: {data.keys()}')
```

## Step 2: Implementation Steps

1. **Prepare the dataset**
   - Load 3D/4D neuroimaging data
   - Normalize voxel intensities
   - Create data loaders for batching

2. **Define the neural network architecture**
   - Learn representations by contrasting augmented views without requiring labels
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

- [ ] representations_learned
- [ ] downstream_accuracy

## Required Evidence Files

- [ ] `pretrained_encoder.pth`
- [ ] `learned_features.npy`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh pretrained_encoder.pth
   ls -lh learned_features.npy
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: representations_learned
   - Verify: downstream_accuracy

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
