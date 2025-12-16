# Detailed Implementation Plan: KG-018: Extract task-activation knowledge graph from Brainomics Localizer

**Task ID:** KG-018
**Category:** Knowledge Graph

## Overview

**Objective:** Extract task-activation knowledge graph from Brainomics Localizer

**Context:** Link cognitive tasks to their consistent activation patterns across subjects

## Data Source

**Dataset:** Brainomics Localizer
**Data Key:** `nilearn.datasets.fetch_localizer_contrasts`

## Prerequisites

**Required Capabilities:** nilearn_glm_tool; knowledge_graph_tool

### Tool Installation

```bash
# Required tools and libraries
pip install nilearn nibabel scikit-learn
```

## Step 1: Data Acquisition

```python
# Import required libraries
from nilearn import datasets
import os

# Fetch the dataset
data = datasets.fetch_localizer_contrasts()
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
   - Link cognitive tasks to their consistent activation patterns across subjects
   - {user_prompt}

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] tasks>10
- [ ] activation_regions>50

## Required Evidence Files

- [ ] `task_kg.json`
- [ ] `activation_network.html`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh task_kg.json
   ls -lh activation_network.html
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: tasks>10
   - Verify: activation_regions>50

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
