# Quick Start Guide

Get started with autonomous brain imaging analysis in 5 minutes!

## 🚀 In 3 Simple Steps

### Step 1: Create Your Analysis File

Create a new file in `analyses/` directory:

```bash
# Create a new analysis file
touch analyses/my_first_analysis.md
```

### Step 2: Define Your Analysis

Copy this template into your file:

```markdown
# My First Brain Imaging Analysis

## Overview
Test the Neurodesk environment with a simple tool check.

## Requirements
**Container:** freesurfer  
**Command:** freesurfer --version

## Analysis Steps

```bash
echo "Hello from Neurodesk!"
echo "Current directory: $(pwd)"
echo "Date: $(date)"
```
```

### Step 3: Run It!

```bash
# Commit and push
git add analyses/my_first_analysis.md
git commit -m "Add my first analysis"
git push
```

The workflow automatically runs and results appear in `results/` directory!

## 📋 What Happens Next?

1. ✅ GitHub Actions detects your analysis file
2. ✅ Sets up CVMFS and mounts Neurodesk containers
3. ✅ Executes your analysis in the specified container
4. ✅ Commits results back to the repository

## 📊 View Your Results

Results are saved in timestamped directories:

```bash
results/
└── my_first_analysis_YYYYMMDD_HHMMSS/
    └── results.md
```

Open `results.md` to see:
- Your original analysis prompt
- Execution logs
- Command outputs
- Timestamps and metadata

## 🎯 Example Analyses

### Example 1: Simple Version Check

```markdown
# FreeSurfer Version Check

**Container:** freesurfer  
**Command:** freesurfer --version

Simple validation of FreeSurfer installation.
```

### Example 2: Environment Validation

```markdown
# Neurodesk Environment Check

```bash
# List available tools
ls /cvmfs/neurodesk.ardc.edu.au/ | head -10

# Check system info
echo "OS: $(uname -s)"
echo "Kernel: $(uname -r)"
```
```

### Example 3: Multiple Steps

```markdown
# Complete Analysis Pipeline

## Step 1: Preparation
```bash
echo "Setting up analysis..."
mkdir -p /tmp/analysis
cd /tmp/analysis
```

## Step 2: Analysis
```bash
echo "Running analysis..."
# Your analysis commands here
```

## Step 3: Cleanup
```bash
echo "Cleaning up..."
rm -rf /tmp/analysis
```
```

## 🔧 Advanced: Manual Trigger

You can also run analyses manually:

1. Go to **Actions** tab in GitHub
2. Select **Neurodesk Brain Imaging Analysis**
3. Click **Run workflow**
4. Enter analysis file path: `analyses/my_analysis.md`
5. Click **Run workflow** button

## 💡 Tips

### Pro Tip #1: Use Descriptive Names
```bash
# Good names
analyses/t1_brain_extraction.md
analyses/fmri_preprocessing_pipeline.md

# Less descriptive
analyses/test1.md
analyses/analysis.md
```

### Pro Tip #2: Start Simple
Test with simple commands first:
```bash
echo "Hello World"
pwd
date
```

Then gradually add complexity.

### Pro Tip #3: Document Everything
Include detailed comments in your analysis:
```bash
# Step 1: Load data
echo "Loading brain scan data..."

# Step 2: Run preprocessing
echo "Running FSL BET for skull stripping..."
```

### Pro Tip #4: Check Logs
Always review the GitHub Actions logs and results files.

## 🆘 Troubleshooting

### "Container not found"
- Check container name spelling
- List available containers: `ls /cvmfs/neurodesk.ardc.edu.au/`

### "Command failed"
- Verify command syntax for the specific tool
- Check tool documentation
- Test locally first if possible

### "No results generated"
- Check GitHub Actions logs for errors
- Verify bash code block formatting (use triple backticks)
- Ensure file is in `analyses/` directory

## 📚 Next Steps

1. **Read the Full Documentation**
   - [README.md](README.md) - Complete guide
   - [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution guidelines
   - [SECURITY.md](SECURITY.md) - Security information

2. **Explore Examples**
   - `analyses/example_analysis.md` - Basic example
   - `analyses/advanced_example.md` - Complex example
   - `analyses/TEMPLATE.md` - Template for new analyses

3. **Try Real Analyses**
   - Brain extraction with FSL BET
   - Cortical reconstruction with FreeSurfer
   - Diffusion imaging with MRtrix3
   - fMRI preprocessing with AFNI

4. **Join the Community**
   - Open issues for questions
   - Share your analyses
   - Contribute improvements

## 🎉 You're Ready!

Start creating your brain imaging analyses and let GitHub Copilot work autonomously!

---

**Need Help?** Check the [CONTRIBUTING.md](CONTRIBUTING.md) or open an issue.
