# DATA-001 Analysis Scripts

This directory contains the implementation for task DATA-001: **Fetch and Validate BIDS Structure for Haxby Dataset**.

## Files Created

### 1. `run_analysis.sh` 
**Purpose**: Main bash script that performs the BIDS validation analysis

**What it does**:
- Downloads the Haxby dataset (OpenNeuro ds000105) using datalad
- Validates the BIDS structure using bids-validator
- Performs manual checks if bids-validator is unavailable
- Extracts required evidence files
- Generates validation reports and summaries
- Creates documentation for the evidence

**Key features**:
- Error handling with `set -e` (exit on error)
- Debug output with `set -x` (print commands)
- Fallback validation if bids-validator not available
- Temporary working directory for clean execution
- Comprehensive logging and reporting

**Usage**:
```bash
bash run_analysis.sh
```

### 2. `.github/workflows/data-001.yml`
**Purpose**: GitHub Actions workflow for automated execution

**Workflow steps**:
1. Checkout repository
2. Configure Git for commits
3. Set up environment (verify datalad, python)
4. Install Python dependencies
5. Run the analysis script
6. Verify evidence files were created
7. Commit and push evidence to repository
8. Upload artifacts for backup
9. Generate summary report

**Triggers**:
- Manual dispatch (workflow_dispatch)
- Push to task files or workflow file

**Runner**: Self-hosted with neurodesk installed

**Usage**: Run from GitHub Actions UI or triggered automatically on push

### 3. `README.md`
**Purpose**: User documentation for the task

**Contents**:
- Task overview and objectives
- Requirements and dependencies
- Execution instructions (local and GitHub Actions)
- Expected outputs and evidence files
- Acceptance metrics
- Troubleshooting guide
- References and links

## Evidence Files (Generated)

When the analysis runs successfully, the following files are created in the `evidence/` subdirectory:

### Required Evidence ✓

1. **dataset_description.json**
   - BIDS dataset descriptor
   - Contains: Name, BIDSVersion, Authors, etc.
   - Proves: Dataset follows BIDS specification

2. **participants.tsv**
   - Tab-separated list of participants
   - Contains: participant_id and metadata columns
   - Proves: All subjects are documented

### Additional Evidence

3. **validation_summary.json**
   - JSON summary of all checks
   - Acceptance metrics pass/fail
   - Subject counts and validation status

4. **bids_validation_report.txt**
   - Full output from bids-validator
   - Detailed warnings and errors (if any)
   - Structural validation results

5. **README.md**
   - Documentation of evidence
   - Timestamp and dataset information

## Execution Flow

```
┌─────────────────────────────────────┐
│  GitHub Actions Workflow Triggered  │
└─────────────┬───────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│   Setup Environment (neurodesk)     │
│   - Python, datalad, git            │
└─────────────┬───────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│   Run run_analysis.sh               │
│   ┌───────────────────────────────┐ │
│   │ 1. Create temp workspace      │ │
│   │ 2. Download ds000105          │ │
│   │ 3. Get essential files        │ │
│   │ 4. Run BIDS validation        │ │
│   │ 5. Extract evidence           │ │
│   │ 6. Generate reports           │ │
│   │ 7. Create documentation       │ │
│   └───────────────────────────────┘ │
└─────────────┬───────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│   Verify Evidence Files             │
│   - dataset_description.json ✓      │
│   - participants.tsv ✓              │
└─────────────┬───────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│   Commit & Push to Repository       │
│   - Add evidence directory          │
│   - Commit with detailed message    │
│   - Push to main branch             │
└─────────────┬───────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│   Upload Artifacts                  │
│   - Backup to GitHub artifacts      │
│   - 90-day retention                │
└─────────────┬───────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│   Generate Summary Report           │
│   - Display in Actions UI           │
│   - Show validation results         │
└─────────────────────────────────────┘
```

## Dependencies

### System Requirements
- **OS**: Linux (tested on Ubuntu with neurodesk)
- **Git**: For repository operations
- **Datalad**: For OpenNeuro dataset download
- **Python 3.7+**: For validation scripts

### Python Packages
```bash
pip install bids-validator pandas numpy
```

### Optional
- **Node.js + npm**: Alternative for bids-validator installation
- **FSL**: Available via neurodesk module system (not needed for this task)

## Testing Locally

To test the script locally (without GitHub Actions):

```bash
# Navigate to the task directory
cd Data_Management/DATA-001-Fetch-and-validate-BIDS-structure/

# Ensure script is executable
chmod +x run_analysis.sh

# Run the script
./run_analysis.sh

# Check the generated evidence
ls -la evidence/
```

## Acceptance Criteria

The task passes when:

1. ✅ **bids_valid**: Dataset structure conforms to BIDS specification
   - Verified by: bids-validator or manual checks
   - Criteria: No critical errors in BIDS structure

2. ✅ **all_subjects_present**: All subjects have proper directories
   - Verified by: Comparing participants.tsv to directory listing
   - Criteria: Each participant_id in TSV has a matching sub-* directory

Both criteria must be met for the task to be considered complete.

## Troubleshooting

### Script fails with "datalad: command not found"
**Solution**: Ensure datalad is installed and in PATH
```bash
pip install datalad datalad-osf
```

### Large dataset download times out
**Solution**: The script only downloads essential files to minimize bandwidth
```bash
# If needed, increase timeout or download in chunks
datalad get -J 4 dataset_description.json participants.tsv
```

### BIDS validator shows warnings
**Note**: Warnings are acceptable. The script looks for critical errors only.

### Evidence not committed
**Check**: Verify Git is configured correctly
```bash
git config user.name
git config user.email
```

## Next Steps

After successfully running DATA-001, you can:

1. Review the evidence files in the `evidence/` directory
2. Check validation results in `validation_summary.json`
3. Use the validated dataset for further analysis tasks
4. Adapt the script structure for other data management tasks (DATA-002 through DATA-020)

## Contributing

To improve this task implementation:

1. Add more comprehensive BIDS checks
2. Optimize download to get only necessary files
3. Add support for alternative dataset sources
4. Enhance error messages and logging
5. Create templates for other tasks in the benchmark

## License

This implementation is part of the Brain Researcher Benchmark project.

## References

- [BIDS Specification](https://bids-specification.readthedocs.io/)
- [Datalad Handbook](http://handbook.datalad.org/)
- [OpenNeuro](https://openneuro.org/)
- [Neurodesk](https://www.neurodesk.org/)
