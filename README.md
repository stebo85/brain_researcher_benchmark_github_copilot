# Brain Researcher Benchmark - GitHub Copilot

Autonomous brain imaging analysis system using GitHub Copilot, Neurodesk containers, and CVMFS.

## Overview

This repository enables GitHub Copilot to work autonomously on brain imaging analyses using Neurodesk containers mounted via CVMFS (CernVM File System) into GitHub Actions runners. Every analysis is prompted via a markdown file, and all results and thought processes are stored back to the repository.

## Features

- 🧠 **Autonomous Brain Imaging Analysis**: GitHub Actions workflows execute analyses automatically
- 🐳 **Neurodesk Container Integration**: Access to pre-configured neuroimaging tools via CVMFS
- 📝 **Markdown-Based Prompts**: Define analyses using simple markdown files
- 📊 **Automatic Result Storage**: All outputs and logs are committed back to the repository
- 🔄 **Continuous Integration**: Triggered on push or manual workflow dispatch

## How It Works

1. **Create an Analysis Prompt**: Write a markdown file in the `analyses/` directory describing your brain imaging analysis
2. **Trigger the Workflow**: Either push the markdown file or manually trigger the workflow
3. **Automatic Execution**: GitHub Actions:
   - Mounts CVMFS with Neurodesk containers
   - Parses your analysis prompt
   - Executes the requested commands in the appropriate container
   - Captures all outputs and logs
4. **Results Stored**: The complete analysis results are committed to the `results/` directory

## Quick Start

### 1. Create an Analysis Prompt

Create a new markdown file in the `analyses/` directory (e.g., `analyses/my_analysis.md`):

```markdown
# My Brain Imaging Analysis

## Overview
Brief description of what this analysis does.

## Requirements
**Container:** freesurfer  
**Command:** recon-all -version

## Analysis Steps
```bash
echo "Running my analysis..."
# Add your analysis commands here
```
```

### 2. Trigger the Analysis

**Option A: Automatic Trigger (Recommended)**
- Simply commit and push your analysis markdown file to the repository
- The workflow automatically detects new/modified analysis files

```bash
git add analyses/my_analysis.md
git commit -m "Add new brain imaging analysis"
git push
```

**Option B: Manual Trigger**
- Go to the "Actions" tab in GitHub
- Select "Neurodesk Brain Imaging Analysis" workflow
- Click "Run workflow"
- Enter the path to your analysis file

### 3. View Results

Results are automatically committed to the `results/` directory with timestamps:
```
results/
  └── my_analysis_20231214_120000/
      └── results.md
```

Each results file contains:
- Original analysis prompt
- Execution logs
- Container outputs
- Thought process and findings
- Timestamps and metadata

## Repository Structure

```
.
├── .github/
│   └── workflows/
│       └── neurodesk-analysis.yml    # Main workflow for brain imaging analyses
├── analyses/                         # Analysis prompt markdown files
│   └── example_analysis.md          # Example analysis prompt
├── results/                          # Generated analysis results (auto-created)
├── scripts/
│   └── run_analysis.sh              # Analysis execution script
└── README.md                        # This file
```

## Available Neurodesk Tools

The Neurodesk repository provides access to numerous neuroimaging tools including:
- **FreeSurfer**: Cortical reconstruction and analysis
- **FSL**: FMRIB Software Library for brain imaging
- **ANTS**: Advanced Normalization Tools
- **SPM**: Statistical Parametric Mapping
- **AFNI**: Analysis of Functional NeuroImages
- And many more...

## Example Analysis Prompts

### Example 1: FreeSurfer Version Check
```markdown
# FreeSurfer Version Check

**Container:** freesurfer  
**Command:** freesurfer --version
```

### Example 2: FSL Installation Check
```markdown
# FSL Environment Validation

**Container:** fsl  
**Command:** flirt -version
```

### Example 3: Custom Script Execution
```markdown
# Brain Volume Analysis

```bash
echo "Analyzing brain volumes..."
# Your custom analysis script
```
```

## Advanced Usage

### Environment Variables

The workflow provides the following environment variables:
- `CVMFS_PATH`: Path to the CVMFS mount point (default: `/cvmfs/neurodesk.ardc.edu.au`)

### Workflow Inputs

The workflow accepts the following inputs:
- `analysis_file`: Path to the analysis prompt markdown file (required for manual triggers)

### Using Custom Data

To use your own neuroimaging data:
1. Upload data files to the repository (in a `data/` directory)
2. Reference these files in your analysis prompt
3. The workflow will have access to all repository files

## Troubleshooting

### CVMFS Not Mounting
- Check the workflow logs for CVMFS configuration errors
- Verify the Neurodesk repository is accessible
- Ensure GitHub Actions runner has sufficient permissions

### Container Not Found
- Verify the container name matches available Neurodesk containers
- Check the CVMFS mount for available tools: `ls /cvmfs/neurodesk.ardc.edu.au/`

### Command Execution Fails
- Review the results markdown file for detailed error messages
- Ensure the command syntax is correct for the container
- Verify all required input files are available

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add your analysis prompts or workflow improvements
4. Submit a pull request

## License

This project is open source. See the LICENSE file for details.

## References

- [Neurodesk Documentation](https://www.neurodesk.org/)
- [CVMFS Documentation](https://cvmfs.readthedocs.io/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

## Support

For issues or questions:
- Open an issue in this repository
- Check the workflow execution logs in the Actions tab
- Review the generated results files for detailed error messages
