# STATINF-002: Apply FDR correction to group activation map from Localizer

## Task Id

STATINF-002

## Task Catefory

Statistical Inference

## Mode

Full-Stack

## User Prompt

Apply FDR correction to group activation map from Localizer

## Input Data Ref

Brainomics Localizer

## Data Key

nilearn.datasets.fetch_localizer_contrasts

## Context Block

Control false discovery rate to handle testing thousands of brain voxels

## Expected Capability

multiple_comparison_tool

## Acceptance Metrics

fdr_threshold; significant_voxels>100

## Evidence Required

fdr_corrected_map.nii.gz; qvals.nii.gz

