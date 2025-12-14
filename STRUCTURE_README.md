# Brain Researcher Benchmark - Directory Structure

This repository contains 440 neuroimaging analysis tasks organized into subdirectories by category.

## Directory Structure

Each task has been organized into the following structure:
```
Category_Name/
  └── TASK-ID-Short-Description/
      └── prompt.md
```

## Categories

The benchmark includes the following 22 categories:

1. **Data_Management** (20 tasks) - Dataset fetching, validation, caching, and organization
2. **Preprocessing** (20 tasks) - fMRI preprocessing, motion correction, spatial normalization
3. **Quality_Control** (20 tasks) - Quality assurance, artifact detection, QC reporting
4. **Registration** (20 tasks) - Image registration, normalization, alignment
5. **Segmentation** (20 tasks) - Tissue segmentation, parcellation, anatomical labeling
6. **Statistical_Analysis** (20 tasks) - GLM, group analysis, statistical inference
7. **Connectivity** (20 tasks) - Functional connectivity, network analysis, graph theory
8. **Electrophysiology** (20 tasks) - MEG/EEG preprocessing, source localization
9. **Diffusion** (20 tasks) - DWI preprocessing, tractography, structural connectivity
10. **Surface** (20 tasks) - Surface-based analysis, cortical thickness, FreeSurfer
11. **Machine_Learning** (20 tasks) - SVM, random forest, cross-validation, MVPA
12. **Deep_Learning** (20 tasks) - CNN, RNN, GANs, transfer learning
13. **Knowledge_Graph** (20 tasks) - Brain atlases, ontologies, knowledge representation
14. **Meta-Analysis** (20 tasks) - Coordinate-based meta-analysis, ALE, MKDA
15. **Statistical_Inference** (20 tasks) - Permutation testing, FDR correction, Bayesian inference
16. **Clinical_Analysis** (20 tasks) - Diagnosis, lesion analysis, clinical applications
17. **Real-time_Processing** (20 tasks) - Neurofeedback, online analysis
18. **Simulation** (20 tasks) - Synthetic data generation, neural mass models
19. **Visualization** (20 tasks) - Brain plots, interactive visualizations, 3D rendering
20. **Workflow** (20 tasks) - End-to-end pipelines, batch processing
21. **Data_Harmonization** (20 tasks) - Multi-site harmonization, batch effects
22. **Specialized_Processing** (20 tasks) - TEDANA, AROMA, CompCor, advanced denoising

## Prompt File Structure

Each `prompt.md` file contains the following information from the CSV:

- **Task ID**: Unique identifier (e.g., DATA-001, PREP-001)
- **Task Category**: Broad category name
- **Mode**: Full-Stack (all tasks)
- **User Prompt**: Task description
- **Input Data Ref**: Dataset name or reference
- **Data Key**: API function or identifier for data access
- **Context Block**: Detailed explanation of the task
- **Expected Capability**: Required tools/capabilities
- **Acceptance Metrics**: Success criteria
- **Evidence Required**: Output files expected

## Usage

To view a specific task:
```bash
cat Category_Name/TASK-ID-Description/prompt.md
```

For example:
```bash
cat Data_Management/DATA-001-Fetch-and-validate-BIDS-structure/prompt.md
```

## Statistics

- **Total Tasks**: 440
- **Total Categories**: 22
- **Tasks per Category**: 20
- **Total Subdirectories**: 445
- **Total prompt.md files**: 440
