# ML-012: Apply ANOVA feature selection before classification on Localizer data

## Task Id

ML-012

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Apply ANOVA feature selection before classification on Localizer data

## Input Data Ref

Brainomics Localizer

## Data Key

nilearn.datasets.fetch_localizer_contrasts

## Context Block

Use univariate statistics to preselect most task-responsive voxels before training classifier

## Expected Capability

anova_feature_selection; mvpa_tool

## Acceptance Metrics

top_1000_voxels_selected; accuracy_improved

## Evidence Required

selected_voxels.nii.gz; anova_fscores.npy

