# DATA-001: Fetch and Validate BIDS Structure

## Task Overview

**Task ID**: DATA-001  
**Category**: Data Management  
**Dataset**: Haxby dataset (OpenNeuro ds000105)

### Objective
Download the Haxby dataset from OpenNeuro and validate that all files are organized according to BIDS standards with proper naming conventions.

## Requirements

### Software Dependencies
- **datalad**: For downloading OpenNeuro datasets
- **Python 3**: For validation scripts
- **pip**: For installing Python packages
- **bids-validator** (optional): For comprehensive BIDS validation

### Python Packages
- `bids-validator` (or via npm)
- `pandas`
- `numpy`

## Running the Analysis

### Option 1: Local Execution

```bash
# Navigate to the task directory
cd Data_Management/DATA-001-Fetch-and-validate-BIDS-structure/

# Run the analysis script
bash run_analysis.sh
```

### Option 2: GitHub Actions (Recommended)

The analysis can be triggered automatically via GitHub Actions on the custom runner with neurodesk:

1. Navigate to the Actions tab in the GitHub repository
2. Select the workflow "DATA-001 - Fetch and Validate BIDS Structure"
3. Click "Run workflow"

The workflow will:
- Download the Haxby dataset using datalad
- Validate the BIDS structure
- Generate required evidence files
- Commit the results back to the repository

## Expected Outputs

### Evidence Files (Required)

The analysis generates the following evidence files in the `evidence/` directory:

1. **dataset_description.json** ✓ Required
   - BIDS dataset descriptor with metadata
   - Contains dataset name, BIDS version

2. **participants.tsv** ✓ Required
   - List of all participants with their metadata
   - Tab-separated file with participant IDs

3. **validation_summary.json**
   - JSON summary of validation results
   - Includes acceptance metrics pass/fail status

4. **bids_validation_report.txt**
   - Detailed output from BIDS validator
   - Lists warnings, errors, and structural checks

5. **README.md**
   - Documentation of the evidence files
   - Explains validation results

## Acceptance Metrics

The task is considered successful when:

- ✅ **bids_valid**: Dataset passes BIDS validation
- ✅ **all_subjects_present**: All subjects listed in participants.tsv have corresponding directories

## Dataset Information

- **Name**: Haxby 2001 - Visual Object Recognition
- **OpenNeuro ID**: ds000105
- **URL**: https://openneuro.org/datasets/ds000105
- **Modality**: Functional MRI (fMRI)
- **Subjects**: 6 subjects
- **Task**: Visual object recognition with 8 categories

## Troubleshooting

### Issue: datalad install fails
```bash
# Try with --reckless flag
datalad install --reckless=auto https://github.com/OpenNeuroDatasets/ds000105.git
```

### Issue: bids-validator not found
```bash
# Install via npm (alternative to pip)
npm install -g bids-validator

# Or use Python implementation
pip install --user bids-validator
```

### Issue: Out of disk space
The dataset is approximately 1.5 GB. The script only downloads essential files (metadata and one sample subject) to minimize disk usage.

## Script Details

The `run_analysis.sh` script performs the following steps:

1. **Setup**: Creates evidence directory and temporary workspace
2. **Download**: Uses datalad to install ds000105 from OpenNeuro
3. **Retrieve**: Gets essential files (dataset_description.json, participants.tsv, sample data)
4. **Validate**: Runs BIDS validator or manual validation checks
5. **Extract**: Copies required evidence files
6. **Report**: Generates summary JSON and README
7. **Cleanup**: Returns to original directory

## GitHub Actions Workflow

The workflow file `.github/workflows/data-001.yml` includes:

- Automatic triggering on push to task files
- Manual workflow dispatch option
- Self-hosted runner with neurodesk
- Automatic commit of evidence files
- Artifact upload for evidence preservation
- Summary report in GitHub Actions UI

## References

- [BIDS Specification](https://bids-specification.readthedocs.io/)
- [OpenNeuro ds000105](https://openneuro.org/datasets/ds000105)
- [Datalad Documentation](https://docs.datalad.org/)
- [BIDS Validator](https://github.com/bids-standard/bids-validator)

## Status

- [ ] Task not started
- [ ] Analysis running
- [ ] Analysis completed
- [ ] Evidence committed
- [ ] Validation passed

Update this checklist as you progress through the analysis.
