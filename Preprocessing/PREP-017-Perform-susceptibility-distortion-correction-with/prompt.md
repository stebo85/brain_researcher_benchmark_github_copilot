# PREP-017: Perform susceptibility distortion correction with opposite phase encoding on FIAC

## Task Id

PREP-017

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Perform susceptibility distortion correction with opposite phase encoding on FIAC

## Input Data Ref

FIAC dataset

## Data Key

nilearn.datasets.fetch_fiac_first_level

## Context Block

Use scans acquired with reversed phase encoding direction to estimate and correct distortions

## Expected Capability

topup_tool; sdc_correction

## Acceptance Metrics

distortions_corrected; displacement_field

## Evidence Required

corrected_bold.nii.gz; fieldmap_hz.nii.gz

