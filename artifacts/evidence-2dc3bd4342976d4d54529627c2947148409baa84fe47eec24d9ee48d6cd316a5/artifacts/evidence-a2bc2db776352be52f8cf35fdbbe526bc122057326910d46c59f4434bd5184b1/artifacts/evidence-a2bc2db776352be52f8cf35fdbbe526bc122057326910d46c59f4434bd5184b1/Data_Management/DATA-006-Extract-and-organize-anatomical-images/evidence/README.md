# DATA-006 Evidence: Extract and Organize Anatomical Images

## Task Description
Extract and organize anatomical T1w images from ABIDE dataset systematically.

## Evidence Files

1. **T1w_directory/** - Organized anatomical images directory (required)
   - Subject-level organization
   - Systematic file structure
   - Includes README with details

2. **manifest.csv** - File organization manifest (required)
   - Lists all extracted subjects
   - Records site information
   - Tracks phenotypic metadata

3. **validation_summary.json** - Summary of extraction results

## Acceptance Metrics

- **anatomicals_extracted**: Anatomical images successfully extracted
- **organized_structure**: Files organized in systematic structure

## Dataset Information

- **Dataset**: ABIDE (Autism Brain Imaging Data Exchange)
- **Source**: Nilearn datasets
- **Modality**: Structural MRI (T1w)
