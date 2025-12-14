# STATINF-006: Perform TFCE correction on mixed effects GLM results

## Task Id

STATINF-006

## Task Catefory

Statistical Inference

## Mode

Full-Stack

## User Prompt

Perform TFCE correction on mixed effects GLM results

## Input Data Ref

Development fMRI dataset

## Data Key

nilearn.datasets.fetch_development_fmri

## Context Block

Use threshold-free cluster enhancement to avoid arbitrary cluster-forming threshold

## Expected Capability

statistical_inference_tool; fsl_palm_tool

## Acceptance Metrics

tfce_corrected_map; enhanced_sensitivity

## Evidence Required

tfce_map.nii.gz; corrected_pvals.nii.gz

