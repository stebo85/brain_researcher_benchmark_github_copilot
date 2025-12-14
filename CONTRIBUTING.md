# Contributing to Brain Researcher Benchmark

Thank you for your interest in contributing to the Brain Researcher Benchmark project! This guide will help you create and submit brain imaging analyses.

## Table of Contents

1. [Getting Started](#getting-started)
2. [Creating an Analysis](#creating-an-analysis)
3. [Workflow Structure](#workflow-structure)
4. [Best Practices](#best-practices)
5. [Troubleshooting](#troubleshooting)

## Getting Started

### Prerequisites

- GitHub account with access to this repository
- Basic understanding of brain imaging analysis
- Familiarity with markdown and bash scripting
- Knowledge of the neuroimaging tool you want to use

### Understanding the System

This repository uses:
- **GitHub Actions**: Automated workflow execution
- **CVMFS**: Network file system for container distribution
- **Neurodesk**: Containerized neuroimaging tools
- **Markdown**: Analysis prompt format

## Creating an Analysis

### Step 1: Use the Template

Copy the template file to create your analysis:

```bash
cp analyses/TEMPLATE.md analyses/my_analysis.md
```

### Step 2: Define Your Analysis

Fill in the following sections:

#### 1. Overview and Description
Clearly describe what your analysis does and why it's important.

#### 2. Requirements
Specify the container and primary command:
```markdown
**Container:** freesurfer  
**Command:** recon-all -version
```

#### 3. Analysis Steps
Add your analysis code in bash code blocks:
````markdown
```bash
echo "Processing brain data..."
# Your analysis commands here
```
````

### Step 3: Test Locally (Optional)

You can test your bash scripts locally before committing:

```bash
bash -n analyses/my_analysis.sh  # Syntax check
```

### Step 4: Submit Your Analysis

```bash
git add analyses/my_analysis.md
git commit -m "Add: [Brief description of analysis]"
git push
```

The workflow will automatically execute your analysis.

## Workflow Structure

### Automatic Execution

When you push an analysis file, the workflow:

1. **Checks out the repository**
2. **Installs and configures CVMFS**
3. **Mounts Neurodesk containers**
4. **Installs Apptainer/Singularity**
5. **Parses your analysis markdown**
6. **Executes the analysis**
7. **Commits results back to the repository**

### Manual Execution

You can also trigger analyses manually:

1. Go to the **Actions** tab
2. Select **Neurodesk Brain Imaging Analysis**
3. Click **Run workflow**
4. Enter the analysis file path
5. Click **Run workflow** button

## Best Practices

### Analysis Design

1. **Start Simple**: Begin with basic validation before complex analyses
2. **Incremental Steps**: Break complex analyses into smaller steps
3. **Document Everything**: Include detailed comments and explanations
4. **Error Handling**: Anticipate and handle potential errors

### Code Quality

```bash
# Good: Clear, commented code
echo "Step 1: Loading data..."
input_file="data/brain_scan.nii.gz"
if [ -f "$input_file" ]; then
    echo "Processing $input_file"
else
    echo "Error: Input file not found"
    exit 1
fi

# Avoid: Uncommented, unclear code
f="data/brain_scan.nii.gz"
[ -f "$f" ] && echo "ok" || exit 1
```

### Markdown Structure

```markdown
# Clear Title

## Logical Sections
- Overview
- Requirements
- Steps
- Outputs
- Notes

### Subsections
Use subsections for clarity

**Emphasis**: Use bold for important terms
`Code`: Use backticks for commands
```

### Container Usage

**Available Containers** (examples):
- `freesurfer` - Cortical reconstruction
- `fsl` - FSL tools
- `ants` - Advanced normalization
- `afni` - AFNI tools
- `spm` - SPM tools
- `mrtrix3` - MRtrix3 diffusion tools

**Finding Containers**:
```bash
# List all available tools
ls /cvmfs/neurodesk.ardc.edu.au/
```

## Analysis Examples

### Example 1: Simple Tool Check

```markdown
# FreeSurfer Version Check

**Container:** freesurfer
**Command:** freesurfer --version

Simple validation that FreeSurfer is available.
```

### Example 2: Data Processing Pipeline

```markdown
# T1 Brain Extraction

**Container:** fsl
**Command:** bet

## Steps

```bash
# Brain extraction using FSL BET
input="data/T1.nii.gz"
output="data/T1_brain.nii.gz"

bet "$input" "$output" -f 0.5 -g 0
```
```

### Example 3: Multi-Step Analysis

```markdown
# Complete Preprocessing Pipeline

## Steps

```bash
# Step 1: Skull stripping
echo "Step 1: Skull stripping..."
bet input.nii.gz brain.nii.gz

# Step 2: Registration
echo "Step 2: Registration..."
flirt -in brain.nii.gz -ref template.nii.gz -out registered.nii.gz

# Step 3: Segmentation
echo "Step 3: Segmentation..."
fast -t 1 -n 3 registered.nii.gz
```
```

## File Organization

```
brain_researcher_benchmark_github_copilot/
├── analyses/           # Your analysis prompts go here
│   ├── TEMPLATE.md    # Template for new analyses
│   ├── example_analysis.md
│   └── my_analysis.md # Your analysis
├── results/           # Auto-generated results
│   └── my_analysis_YYYYMMDD_HHMMSS/
│       └── results.md
├── data/              # (Optional) Your data files
└── scripts/           # System scripts (don't modify)
```

## Troubleshooting

### Common Issues

#### 1. Container Not Found
**Problem**: Container specified in analysis not available
**Solution**: 
```bash
# Check available containers
ls /cvmfs/neurodesk.ardc.edu.au/
```

#### 2. Command Execution Fails
**Problem**: Command doesn't execute in container
**Solution**: 
- Verify command syntax for the specific tool
- Check tool documentation
- Review error messages in results file

#### 3. CVMFS Mount Issues
**Problem**: CVMFS not mounting properly
**Solution**: 
- Check workflow logs in GitHub Actions
- Verify network connectivity
- Review CVMFS configuration in workflow file

#### 4. No Results Generated
**Problem**: Workflow completes but no results appear
**Solution**: 
- Check for errors in execution logs
- Verify bash code blocks are properly formatted
- Ensure markdown file is in `analyses/` directory

### Getting Help

1. **Check the Logs**: Review GitHub Actions logs for detailed error messages
2. **Review Results**: Check the results markdown file for execution details
3. **Open an Issue**: Create a GitHub issue with:
   - Analysis file name
   - Error messages
   - Expected vs actual behavior
4. **Ask Questions**: Use GitHub Discussions for general questions

## Review Process

### For Contributors

1. Create your analysis in `analyses/` directory
2. Commit and push to trigger workflow
3. Review results in `results/` directory
4. Iterate as needed
5. Document findings and insights

### For Maintainers

When reviewing contributions:
- Verify analysis is well-documented
- Check that code is safe and efficient
- Ensure results are reproducible
- Validate scientific methodology

## Code of Conduct

- Be respectful and professional
- Provide constructive feedback
- Share knowledge and help others
- Credit sources and references
- Follow scientific best practices

## Resources

### Documentation
- [Neurodesk Documentation](https://www.neurodesk.org/)
- [GitHub Actions Guide](https://docs.github.com/en/actions)
- [CVMFS Documentation](https://cvmfs.readthedocs.io/)

### Neuroimaging Tools
- [FreeSurfer](https://surfer.nmr.mgh.harvard.edu/)
- [FSL](https://fsl.fmrib.ox.ac.uk/)
- [ANTS](http://stnava.github.io/ANTs/)
- [AFNI](https://afni.nimh.nih.gov/)
- [SPM](https://www.fil.ion.ucl.ac.uk/spm/)

### Learning Resources
- [Neuroimaging Primers](https://www.fmrib.ox.ac.uk/primers/)
- [Neuroimaging in Python](https://nipy.org/)
- [BIDS Standard](https://bids.neuroimaging.io/)

## License

By contributing to this project, you agree that your contributions will be licensed under the same license as the project.

---

Thank you for contributing to the advancement of brain imaging research!
