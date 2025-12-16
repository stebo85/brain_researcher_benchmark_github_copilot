# Detailed Analysis Plans - README

## Overview

This repository now contains detailed implementation plans for all 440 neuroimaging analysis tasks. Each task directory includes:

- `prompt.md` - Original task specification
- `detailed_plan.md` - **NEW**: Step-by-step implementation guide

## What's in a Detailed Plan?

Each `detailed_plan.md` file provides a comprehensive, actionable guide for implementing the analysis task. The plans include:

### 1. Task Overview
- Task ID and category
- Clear objective statement
- Contextual information about the analysis

### 2. Data Source
- Specific dataset name
- **Data Key**: Actual code to fetch data (e.g., `nilearn.datasets.fetch_haxby()`)
- No placeholder or dummy data - all references are to real, accessible datasets

### 3. Prerequisites and Tool Setup
- Required capabilities and tools
- **Neurodesk Module Loading**: Commands to load neuroimaging tools via Neurodesk's module system:
  - `module load fsl/6.0.5` - FSL tools for fMRI analysis
  - `module load freesurfer/7.3.2` - FreeSurfer for surface reconstruction
  - `module load ants/2.3.5` - ANTs for registration
  - `module load afni/22.3.06` - AFNI for preprocessing and analysis
  - `module load mrtrix3/3.0.3` - MRtrix3 for diffusion imaging
  - `module load spm12/12.7219` - SPM12 for statistical analysis
- **Python Package Installation**: Commands for analysis libraries:
  - `pip install nilearn nibabel scikit-learn` - Core neuroimaging and ML
  - `pip install torch torchvision` - Deep learning with PyTorch
  - `pip install mne` - MEG/EEG analysis
  - `pip install dipy` - Diffusion imaging
- **Container-based Tools**: Instructions for preprocessing pipelines:
  - fMRIPrep, MRIQC, QSIPrep via Singularity/Docker
- **Verification Commands**: Check installation with `ml list` and Python imports

### 4. Data Acquisition Steps
- Actual Python code to fetch datasets using nilearn, MNE, or other APIs
- Instructions for OpenNeuro datasets using DataLad
- Specific dataset IDs and download commands

### 5. Implementation Steps
Category-specific guidance tailored to the task type:
- **Preprocessing**: Motion correction, normalization, spatial smoothing
- **Machine Learning**: Data splitting, model training, hyperparameter optimization, evaluation
- **Deep Learning**: Network architecture, training loops, checkpoint management
- **Connectivity**: ROI extraction, correlation matrices, graph metrics
- **Statistical Analysis**: GLM setup, multiple comparison correction, cluster analysis
- **Visualization**: Plot creation, customization, high-resolution export
- **And more** for all 22 categories

### 6. Acceptance Criteria
- Checklist of metrics that must be satisfied
- Specific thresholds and validation requirements

### 7. Required Evidence Files
- Checklist of exact output files needed
- File naming conventions and formats

### 8. Verification Steps
- Commands to check output files exist
- Validation procedures for file formats and contents
- Steps to confirm acceptance metrics are met

### 9. Implementation Notes
- Reminder to use real data (no placeholders)
- Best practices for error handling and logging
- Guidance on debugging and intermediate results

## Statistics

- **Total Tasks**: 440
- **Total Categories**: 22
- **Plans Generated**: 440
- **Coverage**: 100%

## Categories (20 tasks each)

1. Clinical_Analysis
2. Connectivity
3. Data_Harmonization
4. Data_Management
5. Deep_Learning
6. Diffusion
7. Electrophysiology
8. Knowledge_Graph
9. Machine_Learning
10. Meta-Analysis
11. Preprocessing
12. Quality_Control
13. Real-time_Processing
14. Registration
15. Segmentation
16. Simulation
17. Specialized_Processing
18. Statistical_Analysis
19. Statistical_Inference
20. Surface
21. Visualization
22. Workflow

## Usage Examples

### View a specific detailed plan:
```bash
cat Data_Management/DATA-001-Fetch-and-validate-BIDS-structure/detailed_plan.md
```

### List all plans in a category:
```bash
find Preprocessing -name "detailed_plan.md"
```

### Search for plans using specific datasets:
```bash
grep -r "fetch_haxby" */*/detailed_plan.md
```

### Find plans with specific tools:
```bash
grep -r "fMRIPrep" */*/detailed_plan.md
```

## Dataset Coverage

The detailed plans reference real, publicly available datasets including:

### Neuroimaging Datasets (via nilearn):
- Haxby dataset (`nilearn.datasets.fetch_haxby`)
- ADHD-200 (`nilearn.datasets.fetch_adhd`)
- ABIDE (`nilearn.datasets.fetch_abide_pcp`)
- OASIS (`nilearn.datasets.fetch_oasis_vbm`)
- Miyawaki 2008 (`nilearn.datasets.fetch_miyawaki2008`)
- Development fMRI (`nilearn.datasets.fetch_development_fmri`)
- And many more...

### OpenNeuro Datasets:
- ds000105 (Haxby)
- Various task fMRI and resting-state datasets
- Multi-site studies

### MEG/EEG Data:
- MNE sample dataset (`mne.datasets.sample.data_path()`)
- Multimodal datasets

### Other Sources:
- Tractography atlases
- Synthetic data generation templates
- Reference anatomical atlases

## Key Features

✅ **No Placeholders**: All plans reference actual, accessible data sources
✅ **Executable Code**: Includes real Python code snippets for data fetching
✅ **Tool-Specific**: Tailored instructions for each analysis category
✅ **Validated Structure**: All 440 plans have complete, consistent sections
✅ **Actionable Steps**: Clear, numbered implementation steps
✅ **Quality Checks**: Built-in verification and validation procedures

## Implementation Philosophy

These detailed plans are designed to:

1. **Eliminate ambiguity**: Every plan has concrete, specific instructions
2. **Use real data**: No dummy or placeholder data - all references are to actual datasets
3. **Be executable**: Code snippets can be run directly with proper environment setup
4. **Support validation**: Clear acceptance criteria and verification steps
5. **Match expertise level**: Instructions assume neuroimaging domain knowledge

## Generation

These plans were generated using `generate_detailed_plans.py`, which:

- Parses all 440 `prompt.md` files
- Extracts task metadata (ID, category, data sources, requirements, evidence)
- Generates category-specific implementation steps
- Creates comprehensive verification procedures
- Ensures no placeholder or dummy data is used

## Next Steps

With these detailed plans in place, researchers can:

1. Select a task of interest
2. Review the detailed plan
3. Set up the required environment
4. Follow the step-by-step instructions
5. Execute the analysis on real data
6. Validate outputs against acceptance criteria
7. Generate required evidence files

## Questions or Issues?

If you find any issues with the detailed plans or need clarification:

1. Check the original `prompt.md` for task specifications
2. Review the data key for the correct dataset access method
3. Verify you have all required tools installed
4. Consult the verification steps for output validation

---

**Generated**: December 16, 2024
**Version**: 1.0
**Total Plans**: 440/440 (100% coverage)
