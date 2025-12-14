# DATA-002 Evidence: Load and Cache ADHD-200 Dataset

This directory contains evidence for the successful completion of task DATA-002.

## Task Description
Load and cache ADHD-200 dataset with phenotypic data for fast future access.

## Evidence Files

1. **cached_data.pkl** - Cached dataset (required)
   - Contains functional images, confounds, and phenotypic data
   - Enables fast future access without re-downloading
   - Includes timestamp of caching operation

2. **phenotypes.csv** - Phenotypic information (required)
   - Contains age, sex, diagnosis, and other participant metadata
   - Structured as CSV for easy analysis
   - One row per subject

3. **validation_summary.json** - Summary of caching results
   - Overall status and metrics
   - Cache size and subject count
   - Acceptance metrics pass/fail status

## Acceptance Metrics

- **data_cached**: Dataset successfully cached to disk
- **phenotypes_loaded**: Phenotypic data extracted and saved

## Dataset Information

- **Dataset**: ADHD-200
- **Source**: Nilearn datasets
- **Modality**: fMRI
- **Reference**: http://fcon_1000.projects.nitrc.org/indi/adhd200/

## Validation Timestamp

See validation_summary.json for exact timestamp.
