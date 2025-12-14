# REG-003: Apply FSL FNIRT nonlinear warp to OASIS subjects to MNI space

## Task Id

REG-003

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Apply FSL FNIRT nonlinear warp to OASIS subjects to MNI space

## Input Data Ref

OASIS VBM dataset

## Data Key

nilearn.datasets.fetch_oasis_vbm

## Context Block

Use nonlinear field to deform brains accounting for local shape differences

## Expected Capability

fnirt_tool; nonlinear_registration

## Acceptance Metrics

fnirt_complete; warp_field_smooth

## Evidence Required

fnirt_warp.nii.gz; warped_T1w.nii.gz

