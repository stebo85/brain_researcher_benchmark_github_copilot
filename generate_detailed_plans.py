#!/usr/bin/env python3
"""
Generate detailed implementation plans for all neuroimaging tasks.

This script reads all prompt.md files and creates detailed_plan.md files
with step-by-step instructions for implementing each analysis task.
"""

import os
import re
from pathlib import Path
from typing import Dict, Optional


def parse_prompt_file(prompt_path: Path) -> Dict[str, str]:
    """Parse a prompt.md file and extract all fields."""
    with open(prompt_path, 'r') as f:
        content = f.read()
    
    fields = {}
    
    # Extract title
    title_match = re.search(r'^# (.+?)$', content, re.MULTILINE)
    if title_match:
        fields['title'] = title_match.group(1)
    
    # Extract all sections
    sections = {
        'task_id': r'## Task Id\s*\n\s*(.+?)(?:\n\n|\n##|$)',
        'category': r'## Task Catefory\s*\n\s*(.+?)(?:\n\n|\n##|$)',
        'mode': r'## Mode\s*\n\s*(.+?)(?:\n\n|\n##|$)',
        'user_prompt': r'## User Prompt\s*\n\s*(.+?)(?:\n\n|\n##|$)',
        'input_data': r'## Input Data Ref\s*\n\s*(.+?)(?:\n\n|\n##|$)',
        'data_key': r'## Data Key\s*\n\s*(.+?)(?:\n\n|\n##|$)',
        'context': r'## Context Block\s*\n\s*(.+?)(?:\n\n|\n##|$)',
        'capability': r'## Expected Capability\s*\n\s*(.+?)(?:\n\n|\n##|$)',
        'metrics': r'## Acceptance Metrics\s*\n\s*(.+?)(?:\n\n|\n##|$)',
        'evidence': r'## Evidence Required\s*\n\s*(.+?)(?:\n\n|\n##|$)',
    }
    
    for key, pattern in sections.items():
        match = re.search(pattern, content, re.MULTILINE | re.DOTALL)
        if match:
            fields[key] = match.group(1).strip()
        else:
            fields[key] = ''
    
    return fields


def get_data_fetching_instructions(data_key: str, input_data: str) -> str:
    """Generate data fetching instructions based on data key."""
    if not data_key:
        return f"# Note: Specific data source not specified. Use appropriate {input_data} data.\n"
    
    instructions = []
    
    # Check if it's a nilearn dataset
    if 'nilearn.datasets.' in data_key:
        function = data_key.strip()
        instructions.append("```python")
        instructions.append("# Import required libraries")
        instructions.append("from nilearn import datasets")
        instructions.append("import os")
        instructions.append("")
        instructions.append("# Fetch the dataset")
        if 'fetch_haxby' in function:
            instructions.append("data = datasets.fetch_haxby()")
        elif 'fetch_adhd' in function:
            instructions.append("data = datasets.fetch_adhd(n_subjects=30)")
        elif 'fetch_abide_pcp' in function:
            instructions.append("data = datasets.fetch_abide_pcp(n_subjects=30, pipeline='cpac')")
        elif 'fetch_miyawaki2008' in function:
            instructions.append("data = datasets.fetch_miyawaki2008()")
        elif 'fetch_development_fmri' in function:
            instructions.append("data = datasets.fetch_development_fmri(n_subjects=30)")
        elif 'fetch_surf_nki_enhanced' in function:
            instructions.append("data = datasets.fetch_surf_nki_enhanced(n_subjects=10)")
        elif 'fetch_oasis_vbm' in function:
            instructions.append("data = datasets.fetch_oasis_vbm(n_subjects=50)")
        else:
            # Generic fetch
            func_name = function.split('.')[-1]
            instructions.append(f"data = datasets.{func_name}()")
        
        instructions.append("print(f'Data downloaded to: {data.keys()}')")
        instructions.append("```")
    
    # Check if it's OpenNeuro
    elif 'openneuro' in data_key.lower() or 'ds0' in data_key.lower():
        dataset_id = data_key.split()[-1] if ' ' in data_key else data_key
        instructions.append("```bash")
        instructions.append("# Install DataLad if not available")
        instructions.append("# pip install datalad")
        instructions.append("")
        instructions.append("# Clone the dataset from OpenNeuro")
        if 'ds0' in dataset_id:
            instructions.append(f"datalad install https://github.com/OpenNeuroDatasets/{dataset_id}.git")
            instructions.append(f"cd {dataset_id}")
            instructions.append("datalad get .")
        else:
            instructions.append(f"# Dataset: {dataset_id}")
            instructions.append("# Use appropriate OpenNeuro dataset ID")
        instructions.append("```")
    
    # Other data sources
    else:
        instructions.append(f"# Data source: {data_key}")
        instructions.append(f"# Follow standard procedures to obtain {input_data}")
    
    return '\n'.join(instructions)


def get_tool_setup_instructions(capability: str, user_prompt: str, context: str) -> str:
    """Generate detailed tool setup instructions based on expected capabilities."""
    if not capability:
        return ""
    
    instructions = []
    neurodesk_tools = []
    python_packages = []
    container_tools = []
    tool_details = {}  # Store detailed information about each tool
    
    tools = [t.strip() for t in capability.split(';')]
    
    # Map tools to their installation methods with detailed usage info
    for tool in tools:
        tool_lower = tool.lower()
        
        # Neuroimaging tools available in Neurodesk
        if 'fsl' in tool_lower:
            neurodesk_tools.append(('fsl', '6.0.5'))
            tool_details['fsl'] = {
                'purpose': 'FSL (FMRIB Software Library) provides tools for fMRI, MRI and DTI analysis',
                'commands': ['fsl', 'bet', 'flirt', 'feat', 'eddy', 'topup'],
                'location': 'Available via Neurodesk module system',
                'usage': 'Use for brain extraction, registration, preprocessing, and analysis'
            }
        elif 'freesurfer' in tool_lower:
            neurodesk_tools.append(('freesurfer', '7.3.2'))
            tool_details['freesurfer'] = {
                'purpose': 'FreeSurfer for cortical surface reconstruction and analysis',
                'commands': ['recon-all', 'mris_convert', 'mri_convert', 'freeview'],
                'location': 'Available via Neurodesk module system',
                'usage': 'Use for surface-based morphometry and cortical parcellation'
            }
        elif 'ants' in tool_lower:
            neurodesk_tools.append(('ants', '2.3.5'))
            tool_details['ants'] = {
                'purpose': 'ANTs (Advanced Normalization Tools) for registration and normalization',
                'commands': ['antsRegistration', 'antsApplyTransforms', 'N4BiasFieldCorrection'],
                'location': 'Available via Neurodesk module system',
                'usage': 'Use for image registration, segmentation, and bias correction'
            }
        elif 'afni' in tool_lower:
            neurodesk_tools.append(('afni', '22.3.06'))
            tool_details['afni'] = {
                'purpose': 'AFNI (Analysis of Functional NeuroImages) for fMRI analysis',
                'commands': ['3dvolreg', '3dTstat', '3dClustSim', '3dDeconvolve'],
                'location': 'Available via Neurodesk module system',
                'usage': 'Use for motion correction, statistical analysis, and visualization'
            }
        elif 'mrtrix' in tool_lower or 'mrtrix3' in tool_lower:
            neurodesk_tools.append(('mrtrix3', '3.0.3'))
            tool_details['mrtrix3'] = {
                'purpose': 'MRtrix3 for diffusion MRI analysis and tractography',
                'commands': ['dwi2tensor', 'tckgen', 'dwi2fod', 'mrconvert'],
                'location': 'Available via Neurodesk module system',
                'usage': 'Use for fiber tracking, fixel-based analysis, and DTI modeling'
            }
        elif 'spm' in tool_lower:
            neurodesk_tools.append(('spm12', '12.7219'))
            tool_details['spm12'] = {
                'purpose': 'SPM12 (Statistical Parametric Mapping) for fMRI/PET analysis',
                'commands': ['matlab -batch "spm"', 'spm_standalone'],
                'location': 'Available via Neurodesk module system',
                'usage': 'Use for preprocessing, statistical modeling, and group analysis'
            }
        
        # Python-based analysis tools
        if 'nilearn' in tool_lower or 'glm' in tool_lower:
            python_packages.extend(['nilearn', 'nibabel', 'scikit-learn'])
            tool_details['nilearn'] = {
                'purpose': 'Nilearn for statistical learning on neuroimaging data',
                'usage': 'Use for GLM analysis, decoding, connectivity, and plotting'
            }
        elif 'pytorch' in tool_lower or 'dl_pytorch' in tool_lower or 'cnn' in tool_lower or '3d_cnn' in tool_lower:
            python_packages.extend(['torch', 'torchvision', 'nibabel'])
            tool_details['pytorch'] = {
                'purpose': 'PyTorch for deep learning on brain imaging data',
                'usage': 'Use for 3D CNNs, classification, and custom neural network architectures'
            }
        elif 'tensorflow' in tool_lower:
            python_packages.extend(['tensorflow', 'nibabel'])
            tool_details['tensorflow'] = {
                'purpose': 'TensorFlow for deep learning applications',
                'usage': 'Use for building and training neural networks on imaging data'
            }
        elif 'sklearn' in tool_lower or 'svm' in tool_lower or 'classification' in tool_lower or 'regression' in tool_lower:
            python_packages.extend(['scikit-learn', 'nibabel', 'nilearn'])
            tool_details['sklearn'] = {
                'purpose': 'Scikit-learn for machine learning on brain features',
                'usage': 'Use for SVM, random forests, regression, and cross-validation'
            }
        elif 'connectivity' in tool_lower or 'conn_' in tool_lower:
            python_packages.extend(['nilearn', 'nibabel', 'scipy'])
            tool_details['connectivity'] = {
                'purpose': 'Tools for functional connectivity analysis',
                'usage': 'Use for computing correlation matrices and network analysis'
            }
        elif 'visualization' in tool_lower or 'plotting' in tool_lower:
            python_packages.extend(['nilearn', 'matplotlib', 'seaborn', 'plotly'])
            tool_details['visualization'] = {
                'purpose': 'Visualization libraries for brain imaging',
                'usage': 'Use for creating publication-quality figures and interactive plots'
            }
        elif 'dipy' in tool_lower:
            python_packages.append('dipy')
            tool_details['dipy'] = {
                'purpose': 'DIPY for diffusion MRI analysis',
                'usage': 'Use for tractography, tensor fitting, and DWI preprocessing'
            }
        elif 'mne' in tool_lower or 'meg' in tool_lower or 'eeg' in tool_lower:
            python_packages.append('mne')
            tool_details['mne'] = {
                'purpose': 'MNE-Python for MEG/EEG analysis',
                'usage': 'Use for preprocessing, source localization, and time-frequency analysis'
            }
        
        # Container-based tools
        if 'fmriprep' in tool_lower:
            container_tools.append(('fmriprep', '23.1.3', 'Comprehensive fMRI preprocessing pipeline'))
            tool_details['fmriprep'] = {
                'purpose': 'fMRIPrep - robust preprocessing pipeline for fMRI data',
                'usage': 'Automated workflow for motion correction, distortion correction, and normalization',
                'container': True
            }
        elif 'mriqc' in tool_lower:
            container_tools.append(('mriqc', '23.1.0', 'Automated quality control for MRI'))
            tool_details['mriqc'] = {
                'purpose': 'MRIQC - automated quality assessment for MRI data',
                'usage': 'Generate quality metrics and visual reports for anatomical and functional scans',
                'container': True
            }
        elif 'qsiprep' in tool_lower:
            container_tools.append(('qsiprep', '0.18.1', 'Preprocessing pipeline for diffusion MRI'))
            tool_details['qsiprep'] = {
                'purpose': 'QSIPrep - preprocessing and reconstruction of diffusion MRI',
                'usage': 'Automated DWI preprocessing, distortion correction, and reconstruction',
                'container': True
            }
    
    # Remove duplicates
    python_packages = list(set(python_packages))
    
    # Generate detailed instructions
    instructions.append("### Tool Installation and Setup")
    instructions.append("")
    instructions.append("This analysis requires the following tools:")
    instructions.append("")
    
    # Section 1: Neurodesk tools with detailed explanations
    if neurodesk_tools:
        instructions.append("#### Neuroimaging Software (via Neurodesk)")
        instructions.append("")
        for tool_name, version in neurodesk_tools:
            details = tool_details.get(tool_name, {})
            instructions.append(f"**{tool_name.upper()} {version}**")
            if 'purpose' in details:
                instructions.append(f"- **Purpose**: {details['purpose']}")
            if 'usage' in details:
                instructions.append(f"- **Usage**: {details['usage']}")
            instructions.append(f"- **Loading**: Available through Neurodesk's module system")
            instructions.append("")
            instructions.append("```bash")
            instructions.append(f"# Load {tool_name} from Neurodesk")
            instructions.append(f"module load {tool_name}/{version}")
            instructions.append("")
            instructions.append(f"# Verify {tool_name} is loaded")
            instructions.append("ml list")
            if 'commands' in details:
                instructions.append("")
                instructions.append(f"# Check {tool_name} commands are available")
                instructions.append(f"which {details['commands'][0]}")
            instructions.append("```")
            instructions.append("")
    
    # Section 2: Python packages with detailed explanations
    if python_packages:
        instructions.append("#### Python Packages")
        instructions.append("")
        # Group related packages
        for key, details in tool_details.items():
            if key in ['nilearn', 'pytorch', 'tensorflow', 'sklearn', 'connectivity', 'visualization', 'dipy', 'mne']:
                if not details.get('container'):
                    instructions.append(f"**{key.title()}**")
                    if 'purpose' in details:
                        instructions.append(f"- **Purpose**: {details['purpose']}")
                    if 'usage' in details:
                        instructions.append(f"- **Usage**: {details['usage']}")
                    instructions.append("")
        
        instructions.append("```bash")
        instructions.append("# Install Python packages")
        packages_str = ' '.join(python_packages)
        instructions.append(f"pip install {packages_str}")
        instructions.append("")
        instructions.append("# Verify installation")
        instructions.append(f"python -c \"import {python_packages[0].replace('-', '_')}; print('Successfully imported')\"")
        instructions.append("```")
        instructions.append("")
    
    # Section 3: Container-based tools with detailed usage
    if container_tools:
        instructions.append("#### Container-Based Tools")
        instructions.append("")
        for tool_name, version, description in container_tools:
            details = tool_details.get(tool_name, {})
            instructions.append(f"**{tool_name.upper()} {version}**")
            instructions.append(f"- **Purpose**: {description}")
            if 'usage' in details:
                instructions.append(f"- **Usage**: {details['usage']}")
            instructions.append("- **Access**: Available through Neurodesk or Singularity/Docker")
            instructions.append("")
            instructions.append("```bash")
            instructions.append(f"# Option 1: Use via Neurodesk (recommended)")
            instructions.append(f"# Check if {tool_name} container is available in Neurodesk")
            instructions.append(f"ls /cvmfs/neurodesk.ardc.edu.au/containers/{tool_name}*/")
            instructions.append("")
            instructions.append(f"# Option 2: Pull container directly")
            instructions.append(f"singularity pull docker://nipreps/{tool_name}:{version}")
            instructions.append("")
            instructions.append(f"# Run {tool_name}")
            instructions.append(f"singularity run {tool_name}_{version}.sif --help")
            instructions.append("```")
            instructions.append("")
    
    # Section 4: Generic setup for unmatched tools
    if not neurodesk_tools and not python_packages and not container_tools:
        instructions.append("#### Required Tools")
        instructions.append("")
        instructions.append("The specific tools needed are listed in the **Required Capabilities** section above.")
        instructions.append("")
        instructions.append("```bash")
        instructions.append("# Search for available tools in Neurodesk")
        instructions.append("ml av  # List all available modules")
        instructions.append("ml av <toolname>  # Search for specific tool")
        instructions.append("")
        instructions.append("# Load required tools")
        instructions.append("module load <toolname>/<version>")
        instructions.append("")
        instructions.append("# Install Python packages if needed")
        instructions.append("pip install <package-name>")
        instructions.append("```")
        instructions.append("")
    
    # Section 5: Final verification
    instructions.append("#### Environment Verification")
    instructions.append("")
    instructions.append("```bash")
    instructions.append("# Verify all tools are accessible")
    if neurodesk_tools:
        instructions.append("ml list  # Should show loaded modules")
    if python_packages:
        instructions.append(f"python -c \"import {python_packages[0].replace('-', '_')}\"  # Should complete without error")
    instructions.append("")
    instructions.append("# Check system resources")
    instructions.append("free -h  # Check available memory")
    instructions.append("df -h .  # Check available disk space")
    instructions.append("```")
    instructions.append("")
    
    return '\n'.join(instructions)


def get_analysis_steps(fields: Dict[str, str]) -> str:
    """Generate detailed analysis steps based on the task."""
    task_id = fields.get('task_id', '')
    user_prompt = fields.get('user_prompt', '')
    context = fields.get('context', '')
    category = fields.get('category', '')
    
    steps = []
    
    # Add context-specific steps
    if 'preprocessing' in category.lower() or 'PREP-' in task_id:
        steps.extend([
            "1. **Load the raw fMRI data**",
            "   - Read the NIfTI files using nibabel",
            "   - Verify data dimensions and headers",
            "",
            "2. **Perform preprocessing steps**",
            f"   - {context}",
            "   - Apply motion correction if needed",
            "   - Apply spatial normalization if required",
            "",
            "3. **Save preprocessed outputs**",
            "   - Write processed data to NIfTI format",
            "   - Ensure proper BIDS naming conventions",
        ])
    
    elif 'machine learning' in category.lower() or 'ML-' in task_id:
        steps.extend([
            "1. **Load and prepare the dataset**",
            "   - Fetch the data using the specified data key",
            "   - Extract features from brain images or connectivity matrices",
            "",
            "2. **Split data into training and testing sets**",
            "   - Use stratified split to maintain class balance",
            "   - Consider cross-validation for robust evaluation",
            "",
            "3. **Train the model**",
            f"   - {context}",
            "   - Optimize hyperparameters using cross-validation",
            "",
            "4. **Evaluate model performance**",
            "   - Calculate accuracy, AUC, precision, recall",
            "   - Generate confusion matrix and ROC curves",
            "",
            "5. **Save trained model and results**",
            "   - Serialize the trained model",
            "   - Save predictions and evaluation metrics",
        ])
    
    elif 'deep learning' in category.lower() or 'DL-' in task_id:
        steps.extend([
            "1. **Prepare the dataset**",
            "   - Load 3D/4D neuroimaging data",
            "   - Normalize voxel intensities",
            "   - Create data loaders for batching",
            "",
            "2. **Define the neural network architecture**",
            f"   - {context}",
            "   - Set appropriate input dimensions",
            "   - Define loss function and optimizer",
            "",
            "3. **Train the deep learning model**",
            "   - Implement training loop with validation",
            "   - Monitor loss and accuracy on validation set",
            "   - Save checkpoints during training",
            "",
            "4. **Evaluate on test set**",
            "   - Load best checkpoint",
            "   - Calculate test metrics",
            "   - Generate learning curves",
            "",
            "5. **Save model and training artifacts**",
            "   - Save final model weights",
            "   - Export training history and plots",
        ])
    
    elif 'connectivity' in category.lower() or 'CONN-' in task_id:
        steps.extend([
            "1. **Load preprocessed fMRI data**",
            "   - Read time series data",
            "   - Verify data quality",
            "",
            "2. **Extract ROI time series**",
            f"   - {context}",
            "   - Use specified atlas for parcellation",
            "   - Extract mean time series from each ROI",
            "",
            "3. **Compute connectivity matrix**",
            "   - Calculate Pearson correlation between ROI time series",
            "   - Apply Fisher z-transformation",
            "",
            "4. **Perform group-level analysis**",
            "   - Compare connectivity between groups if applicable",
            "   - Apply statistical tests",
            "",
            "5. **Save connectivity results**",
            "   - Export connectivity matrices",
            "   - Save statistical comparison results",
        ])
    
    elif 'statistical' in category.lower() or 'STAT-' in task_id:
        steps.extend([
            "1. **Load the analysis data**",
            "   - Read statistical maps or data matrices",
            "   - Verify data structure",
            "",
            "2. **Set up the statistical model**",
            f"   - {context}",
            "   - Define design matrix and contrasts",
            "",
            "3. **Perform statistical analysis**",
            "   - Fit the model to data",
            "   - Compute test statistics",
            "   - Apply multiple comparison corrections",
            "",
            "4. **Generate statistical maps**",
            "   - Create thresholded maps",
            "   - Identify significant clusters",
            "",
            "5. **Save statistical results**",
            "   - Export statistical maps",
            "   - Save cluster information and statistics",
        ])
    
    elif 'visualization' in category.lower() or 'VIZ-' in task_id:
        steps.extend([
            "1. **Load the data to visualize**",
            "   - Read brain maps, matrices, or time series",
            "   - Prepare data for plotting",
            "",
            "2. **Create the visualization**",
            f"   - {context}",
            "   - Set appropriate color maps and thresholds",
            "   - Add labels and annotations",
            "",
            "3. **Customize plot appearance**",
            "   - Adjust figure size and resolution",
            "   - Set plot titles and axis labels",
            "",
            "4. **Save the figure**",
            "   - Export in high resolution (300 dpi)",
            "   - Save in appropriate format (PNG, SVG)",
        ])
    
    elif 'data management' in category.lower() or 'DATA-' in task_id:
        steps.extend([
            "1. **Fetch the dataset**",
            "   - Use the specified data key to download data",
            "   - Verify download completion",
            "",
            "2. **Validate data structure**",
            f"   - {context}",
            "   - Check file organization and naming",
            "",
            "3. **Verify data integrity**",
            "   - Check for missing files",
            "   - Validate metadata",
            "",
            "4. **Generate validation report**",
            "   - Document data structure",
            "   - List any issues found",
        ])
    
    elif 'workflow' in category.lower() or 'WORK-' in task_id:
        steps.extend([
            "1. **Set up the workflow environment**",
            "   - Ensure all required tools are installed",
            "   - Create output directories",
            "",
            "2. **Configure the pipeline**",
            f"   - {context}",
            "   - Set parameters for each processing step",
            "",
            "3. **Execute the workflow**",
            "   - Run the complete pipeline",
            "   - Monitor progress and logs",
            "",
            "4. **Validate outputs**",
            "   - Check that all expected outputs are generated",
            "   - Verify output quality",
            "",
            "5. **Generate summary report**",
            "   - Document pipeline execution",
            "   - Summarize results",
        ])
    
    else:
        # Generic steps
        steps.extend([
            "1. **Prepare the environment**",
            "   - Set up required tools and libraries",
            "   - Create output directories",
            "",
            "2. **Load the data**",
            "   - Fetch or load the input data",
            "   - Verify data integrity",
            "",
            "3. **Perform the analysis**",
            f"   - {context}",
            f"   - {user_prompt}",
            "",
            "4. **Generate outputs**",
            "   - Create required evidence files",
            "   - Validate output formats",
            "",
            "5. **Verify results**",
            "   - Check that acceptance metrics are met",
            "   - Document any issues",
        ])
    
    return '\n'.join(steps)


def get_validation_steps(metrics: str, evidence: str) -> str:
    """Generate validation steps based on acceptance metrics and evidence."""
    steps = []
    
    if metrics:
        steps.append("## Acceptance Criteria")
        steps.append("")
        metrics_list = [m.strip() for m in metrics.split(';')]
        for metric in metrics_list:
            steps.append(f"- [ ] {metric}")
        steps.append("")
    
    if evidence:
        steps.append("## Required Evidence Files")
        steps.append("")
        evidence_list = [e.strip() for e in evidence.split(';')]
        for ev in evidence_list:
            steps.append(f"- [ ] `{ev}`")
        steps.append("")
    
    steps.append("## Verification Steps")
    steps.append("")
    steps.append("1. **Check output files exist**")
    steps.append("   ```bash")
    if evidence:
        for ev in evidence_list:
            if '*' in ev:
                steps.append(f"   ls -lh {ev}")
            else:
                steps.append(f"   ls -lh {ev}")
    steps.append("   ```")
    steps.append("")
    steps.append("2. **Validate file formats and contents**")
    steps.append("   - Ensure NIfTI files have correct dimensions and headers")
    steps.append("   - Verify CSV/TSV files have expected columns")
    steps.append("   - Check that plots are generated and display correctly")
    steps.append("")
    steps.append("3. **Confirm acceptance metrics are satisfied**")
    if metrics:
        for metric in metrics_list:
            steps.append(f"   - Verify: {metric}")
    
    return '\n'.join(steps)


def generate_detailed_plan(fields: Dict[str, str]) -> str:
    """Generate a complete detailed implementation plan."""
    plan = []
    
    # Header
    plan.append(f"# Detailed Implementation Plan: {fields.get('title', 'Task')}")
    plan.append("")
    plan.append(f"**Task ID:** {fields.get('task_id', 'N/A')}")
    plan.append(f"**Category:** {fields.get('category', 'N/A')}")
    plan.append("")
    
    # Overview
    plan.append("## Overview")
    plan.append("")
    plan.append(f"**Objective:** {fields.get('user_prompt', 'N/A')}")
    plan.append("")
    plan.append(f"**Context:** {fields.get('context', 'N/A')}")
    plan.append("")
    
    # Data Information
    plan.append("## Data Source")
    plan.append("")
    plan.append(f"**Dataset:** {fields.get('input_data', 'N/A')}")
    plan.append(f"**Data Key:** `{fields.get('data_key', 'N/A')}`")
    plan.append("")
    
    # Prerequisites
    plan.append("## Prerequisites")
    plan.append("")
    plan.append(f"**Required Capabilities:** {fields.get('capability', 'N/A')}")
    plan.append("")
    
    # Tool Setup
    tool_setup = get_tool_setup_instructions(
        fields.get('capability', ''),
        fields.get('user_prompt', ''),
        fields.get('context', '')
    )
    if tool_setup:
        plan.append(tool_setup)
    
    # Data Fetching
    plan.append("## Step 1: Data Acquisition")
    plan.append("")
    data_instructions = get_data_fetching_instructions(
        fields.get('data_key', ''),
        fields.get('input_data', '')
    )
    plan.append(data_instructions)
    plan.append("")
    
    # Analysis Steps
    plan.append("## Step 2: Implementation Steps")
    plan.append("")
    plan.append(get_analysis_steps(fields))
    plan.append("")
    
    # Validation
    validation = get_validation_steps(
        fields.get('metrics', ''),
        fields.get('evidence', '')
    )
    plan.append(validation)
    plan.append("")
    
    # Notes
    plan.append("## Notes")
    plan.append("")
    plan.append("- This plan uses real data as specified in the Data Key field")
    plan.append("- All code should be executable with the specified datasets")
    plan.append("- Ensure proper error handling and logging throughout")
    plan.append("- Document any deviations from the standard approach")
    plan.append("- Save intermediate results for debugging if needed")
    plan.append("")
    
    return '\n'.join(plan)


def process_all_prompts(base_dir: Path):
    """Process all prompt.md files and generate detailed_plan.md files."""
    prompt_files = list(base_dir.rglob('prompt.md'))
    
    print(f"Found {len(prompt_files)} prompt files")
    
    for i, prompt_path in enumerate(prompt_files, 1):
        try:
            # Parse the prompt file
            fields = parse_prompt_file(prompt_path)
            
            # Generate the detailed plan
            plan_content = generate_detailed_plan(fields)
            
            # Write to detailed_plan.md in the same directory
            plan_path = prompt_path.parent / 'detailed_plan.md'
            with open(plan_path, 'w') as f:
                f.write(plan_content)
            
            if i % 50 == 0:
                print(f"Processed {i}/{len(prompt_files)} files...")
        
        except Exception as e:
            print(f"Error processing {prompt_path}: {e}")
            continue
    
    print(f"\nCompleted! Generated {len(prompt_files)} detailed_plan.md files")


if __name__ == '__main__':
    base_dir = Path('/home/runner/work/brain_researcher_benchmark_github_copilot/brain_researcher_benchmark_github_copilot')
    process_all_prompts(base_dir)
