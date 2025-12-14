# PREP-004: Run motion correction with volume registration on Development fMRI

## Task Id

PREP-004

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Run motion correction with volume registration on Development fMRI

## Input Data Ref

Development fMRI dataset

## Data Key

nilearn.datasets.fetch_development_fmri

## Context Block

Align all brain volumes to compensate for head movement during the scan

## Expected Capability

motion_correction_tool; registration

## Acceptance Metrics

motion_corrected; displacement<2mm

## Evidence Required

motion_corrected_bold.nii.gz; motion_parameters.txt

