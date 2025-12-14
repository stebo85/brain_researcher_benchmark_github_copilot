# REG-017: Run simultaneous registration and segmentation for FIAC structural data

## Task Id

REG-017

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Run simultaneous registration and segmentation for FIAC structural data

## Input Data Ref

FIAC dataset

## Data Key

nilearn.datasets.fetch_fiac_first_level

## Context Block

Jointly optimize brain alignment and tissue classification in unified framework

## Expected Capability

unified_segmentation; spm12

## Acceptance Metrics

segmentation_registered; bias_corrected

## Evidence Required

c1_gm.nii.gz; c2_wm.nii.gz; deformation_field.nii.gz

