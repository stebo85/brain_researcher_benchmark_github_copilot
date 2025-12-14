# SPEC-014: Run nuisance regression with orthogonalization to preserve signal

## Task Id

SPEC-014

## Task Catefory

Specialized Processing

## Mode

Full-Stack

## User Prompt

Run nuisance regression with orthogonalization to preserve signal

## Input Data Ref

Brainomics Localizer

## Data Key

nilearn.datasets.fetch_localizer_contrasts

## Context Block

Remove confounds while preserving task-related variance

## Expected Capability

specialized_processing_tool; nilearn_glm_tool

## Acceptance Metrics

confounds_removed; task_signal_preserved

## Evidence Required

cleaned_beta_maps.nii.gz; variance_partitioning.csv

