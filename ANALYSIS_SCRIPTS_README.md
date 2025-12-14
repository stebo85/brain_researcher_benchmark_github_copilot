# Analysis Scripts for Brain Researcher Benchmark

## Overview

This repository contains **440 analysis scripts** (`run_analysis.sh`) for neuroimaging tasks across 22 categories. Each script is designed to run on a custom GitHub Actions runner with Neurodesk installed.

## Directory Structure

Each task directory contains:
- `prompt.md` - Task description and requirements
- `run_analysis.sh` - Executable bash script to perform the analysis

```
Category_Name/
  └── TASK-ID-Short-Description/
      ├── prompt.md
      └── run_analysis.sh
```

## Script Features

Each `run_analysis.sh` script includes:

1. **Error Handling**: `set -e` exits on error, `set -x` prints commands
2. **Git Configuration**: Automatically configures git user if needed
3. **Module Loading**: Loads required Neurodesk modules (FSL, FreeSurfer, AFNI, ANTs)
4. **Virtual Environment**: Creates isolated Python environment per analysis
5. **Package Installation**: Installs required Python packages (nilearn, pandas, numpy, etc.)
6. **Analysis Execution**: Python code block for the actual analysis
7. **Evidence Generation**: Creates evidence directory with results
8. **Documentation**: Generates README.md describing the evidence files

## Requirements

### System Requirements
- Neurodesk installed (for module loading)
- Python 3.x
- Git configured
- DataLad (for OpenNeuro dataset access)

### Available Modules
Scripts may load the following modules via Neurodesk:
- `fsl` - FSL neuroimaging tools
- `freesurfer` - FreeSurfer surface reconstruction
- `afni` - AFNI analysis tools
- `ants` - ANTs registration tools

### Python Packages
Scripts install these packages via pip:
- nilearn - Neuroimaging in Python
- pandas - Data manipulation
- numpy - Numerical computing
- scikit-learn - Machine learning
- matplotlib - Plotting
- torch/tensorflow - Deep learning (for relevant tasks)

## Running a Script

### Basic Execution

```bash
cd Category_Name/TASK-ID-Description/
./run_analysis.sh
```

### Example

```bash
cd Data_Management/DATA-001-Fetch-and-validate-BIDS-structure/
./run_analysis.sh
```

### Expected Behavior

1. Configures git if needed
2. Loads required modules
3. Creates `.venv` directory for Python packages
4. Downloads/fetches required datasets
5. Runs the analysis
6. Creates `evidence/` directory with results
7. Generates summary and documentation

### Output Structure

After execution:
```
TASK-ID-Description/
  ├── prompt.md
  ├── run_analysis.sh
  ├── .venv/              # Python virtual environment (created)
  └── evidence/           # Analysis results (created)
      ├── README.md       # Evidence documentation
      ├── analysis_summary.json  # Summary of results
      └── [task-specific files]  # Required evidence files
```

## Script Implementation Status

### Template vs. Complete Implementation

The generated scripts are **templates** that include:
- ✅ Complete infrastructure (venv, modules, evidence dirs)
- ✅ Error handling and logging
- ✅ Git configuration
- ✅ Dataset references from prompt.md
- ⚠️  Placeholder Python analysis code

Each script contains a `TODO` comment indicating where task-specific analysis implementation should be added:

```python
# TODO: Implement the actual analysis based on:
# - Task: [User Prompt]
# - Context: [Context Block]
# - Data: [Data Key]
# - Expected evidence: [Evidence Required]
```

### Customizing a Script

To implement a specific analysis:

1. Open the `run_analysis.sh` file
2. Locate the Python code block (between `python3 << 'PYEOF'` and `PYEOF`)
3. Replace the placeholder with actual analysis code
4. Use the data key to fetch the dataset (e.g., `nilearn.datasets.fetch_haxby()`)
5. Implement the analysis described in the prompt.md
6. Save required evidence files to the `evidence/` directory
7. Test the script

## Categories and Task Counts

| Category | Tasks | Scripts Created |
|----------|-------|-----------------|
| Clinical_Analysis | 20 | ✅ 20 |
| Connectivity | 20 | ✅ 20 |
| Data_Harmonization | 20 | ✅ 20 |
| Data_Management | 20 | ✅ 20 |
| Deep_Learning | 20 | ✅ 20 |
| Diffusion | 20 | ✅ 20 |
| Electrophysiology | 20 | ✅ 20 |
| Knowledge_Graph | 20 | ✅ 20 |
| Machine_Learning | 20 | ✅ 20 |
| Meta-Analysis | 20 | ✅ 20 |
| Preprocessing | 20 | ✅ 20 |
| Quality_Control | 20 | ✅ 20 |
| Real-time_Processing | 20 | ✅ 20 |
| Registration | 20 | ✅ 20 |
| Segmentation | 20 | ✅ 20 |
| Simulation | 20 | ✅ 20 |
| Specialized_Processing | 20 | ✅ 20 |
| Statistical_Analysis | 20 | ✅ 20 |
| Statistical_Inference | 20 | ✅ 20 |
| Surface | 20 | ✅ 20 |
| Visualization | 20 | ✅ 20 |
| Workflow | 20 | ✅ 20 |
| **TOTAL** | **440** | **✅ 440** |

## GitHub Actions Integration

These scripts are designed to be executed by GitHub Actions workflows on custom runners with Neurodesk.

### Example Workflow Snippet

```yaml
- name: Run Analysis
  run: |
    cd ${{ matrix.task_dir }}
    ./run_analysis.sh
    
- name: Commit Evidence
  run: |
    git add ${{ matrix.task_dir }}/evidence/
    git commit -m "Add evidence for ${{ matrix.task_dir }}"
    git push
```

## Dataset Access

Scripts use various methods to access datasets:

### OpenNeuro Datasets
```bash
datalad install https://github.com/OpenNeuroDatasets/ds000105.git
```

### Nilearn Datasets
```python
from nilearn.datasets import fetch_haxby
data = fetch_haxby()
```

### Other Sources
See individual `prompt.md` files for dataset-specific access methods.

## Troubleshooting

### Module Not Found
```
Warning: fsl module not found, continuing...
```
- This is expected if the module isn't needed or available
- Scripts continue execution unless the module is critical

### Virtual Environment Issues
```
Error: Failed to create virtual environment
```
- Ensure Python 3 is installed: `python3 --version`
- Check disk space: `df -h`

### DataLad/git-annex Issues
```
Warning: git-annex not found
```
- DataLad requires git-annex for some operations
- Scripts attempt to install it automatically
- Some features may be limited without it

## Evidence Files

Each analysis generates evidence files as specified in `prompt.md`:

- **Required Evidence**: Specified in the "Evidence Required" section
- **Summary**: `analysis_summary.json` with task metadata
- **Documentation**: `README.md` describing the evidence
- **Additional Files**: Task-specific outputs (NIfTI files, plots, CSVs, etc.)

## Validation

To verify all scripts are present and executable:

```bash
# Count scripts
find . -name "run_analysis.sh" | wc -l
# Expected: 440

# Check executability
find . -name "run_analysis.sh" -executable | wc -l
# Expected: 440

# Syntax check a specific script
bash -n Category_Name/TASK-ID/run_analysis.sh
```

## Next Steps

1. **Implement Analysis**: Add task-specific analysis code to each script
2. **Test Locally**: Run scripts on a Neurodesk environment
3. **Setup GitHub Actions**: Configure workflows to run scripts on custom runners
4. **Commit Evidence**: Ensure evidence files are committed back to the repository

## Contributing

When implementing analysis code:
1. Follow the existing script structure
2. Use the data key from `prompt.md`
3. Generate all required evidence files
4. Update `analysis_summary.json` with actual results
5. Test the script before committing

## Support

For issues or questions:
- Check the `prompt.md` for task-specific details
- Review the STRUCTURE_README.md for repository organization
- Consult Neurodesk documentation for module usage

---

**Generated**: 2025-12-14  
**Total Scripts**: 440  
**Status**: Template scripts created, ready for implementation
