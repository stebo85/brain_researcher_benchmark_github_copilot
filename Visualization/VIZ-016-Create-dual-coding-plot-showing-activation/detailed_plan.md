# Detailed Implementation Plan: VIZ-016: Create dual-coding plot showing activation and deactivation

**Task ID:** VIZ-016
**Category:** Visualization

## Overview

**Objective:** Create dual-coding plot showing activation and deactivation

**Context:** Use different colors for increases vs decreases in brain activity

## Data Source

**Dataset:** Localizer task>rest contrast
**Data Key:** ``

## Prerequisites

**Required Capabilities:** advanced_visualization_tool

### Tool Installation

```bash
# Required tools and libraries
pip install nilearn matplotlib seaborn plotly
```

## Step 1: Data Acquisition

# Note: Specific data source not specified. Use appropriate Localizer task>rest contrast data.


## Step 2: Implementation Steps

1. **Load the data to visualize**
   - Read brain maps, matrices, or time series
   - Prepare data for plotting

2. **Create the visualization**
   - Use different colors for increases vs decreases in brain activity
   - Set appropriate color maps and thresholds
   - Add labels and annotations

3. **Customize plot appearance**
   - Adjust figure size and resolution
   - Set plot titles and axis labels

4. **Save the figure**
   - Export in high resolution (300 dpi)
   - Save in appropriate format (PNG, SVG)

## Acceptance Criteria

- [ ] dual_coded_map
- [ ] red_blue_colormap

## Required Evidence Files

- [ ] `activation_deactivation.png`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh activation_deactivation.png
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: dual_coded_map
   - Verify: red_blue_colormap

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
