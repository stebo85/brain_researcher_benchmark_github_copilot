# Detailed Implementation Plan: META-005: Extract coordinates from 100 PubMed fMRI abstracts automatically

**Task ID:** META-005
**Category:** Meta-Analysis

## Overview

**Objective:** Extract coordinates from 100 PubMed fMRI abstracts automatically

**Context:** Mine scientific literature to extract reported brain coordinates and effect sizes

## Data Source

**Dataset:** PubMed IDs list
**Data Key:** ``

## Prerequisites

**Required Capabilities:** literature_mining_tool

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

# Note: Specific data source not specified. Use appropriate PubMed IDs list data.


## Step 2: Implementation Steps

1. **Prepare the environment**
   - Set up required tools and libraries
   - Create output directories

2. **Load the data**
   - Fetch or load the input data
   - Verify data integrity

3. **Perform the analysis**
   - Mine scientific literature to extract reported brain coordinates and effect sizes
   - Extract coordinates from 100 PubMed fMRI abstracts automatically

4. **Generate outputs**
   - Create required evidence files
   - Validate output formats

5. **Verify results**
   - Check that acceptance metrics are met
   - Document any issues

## Acceptance Criteria

- [ ] coordinates_extracted>200
- [ ] papers_parsed=100

## Required Evidence Files

- [ ] `coordinates.csv`
- [ ] `extraction_log.json`

## Verification Steps

1. **Check output files exist**
   ```bash
   ls -lh coordinates.csv
   ls -lh extraction_log.json
   ```

2. **Validate file formats and contents**
   - Ensure NIfTI files have correct dimensions and headers
   - Verify CSV/TSV files have expected columns
   - Check that plots are generated and display correctly

3. **Confirm acceptance metrics are satisfied**
   - Verify: coordinates_extracted>200
   - Verify: papers_parsed=100

## Notes

- This plan uses real data as specified in the Data Key field
- All code should be executable with the specified datasets
- Ensure proper error handling and logging throughout
- Document any deviations from the standard approach
- Save intermediate results for debugging if needed
