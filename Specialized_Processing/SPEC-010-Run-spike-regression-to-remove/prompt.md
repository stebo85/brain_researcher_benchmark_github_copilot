# SPEC-010: Run spike regression to remove sudden motion artifacts

## Task Id

SPEC-010

## Task Catefory

Specialized Processing

## Mode

Full-Stack

## User Prompt

Run spike regression to remove sudden motion artifacts

## Input Data Ref

Development fMRI dataset

## Data Key

nilearn.datasets.fetch_development_fmri

## Context Block

Identify and regress out motion spike timepoints

## Expected Capability

specialized_processing_tool

## Acceptance Metrics

spikes_detected; artifacts_removed

## Evidence Required

spike_regressors.csv; cleaned_data.nii.gz

