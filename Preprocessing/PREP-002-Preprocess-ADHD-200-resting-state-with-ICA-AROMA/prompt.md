# PREP-002: Preprocess ADHD-200 resting-state with ICA-AROMA denoising

## Task Id

PREP-002

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Preprocess ADHD-200 resting-state with ICA-AROMA denoising

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Remove motion artifacts from resting brain scans using independent component analysis to identify noise patterns

## Expected Capability

fmriprep_tool; ica_aroma_tool

## Acceptance Metrics

motion_artifacts_removed; clean_timeseries

## Evidence Required

*_desc-smoothAROMAnonaggr_bold.nii.gz; mixing_matrix.tsv

