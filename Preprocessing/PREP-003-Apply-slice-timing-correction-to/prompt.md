# PREP-003: Apply slice timing correction to SPM auditory data

## Task Id

PREP-003

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Apply slice timing correction to SPM auditory data

## Input Data Ref

SPM auditory dataset

## Data Key

nilearn.datasets.fetch_spm_auditory

## Context Block

Correct for the fact that different brain slices were acquired at slightly different times

## Expected Capability

slice_timing_tool; preprocessing

## Acceptance Metrics

timing_corrected; reference_slice_set

## Evidence Required

slice_time_corrected_bold.nii.gz; timing_parameters.json

