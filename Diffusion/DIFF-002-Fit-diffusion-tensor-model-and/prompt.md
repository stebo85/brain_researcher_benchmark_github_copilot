# DIFF-002: Fit diffusion tensor model and compute FA, MD, RD, AD maps

## Task Id

DIFF-002

## Task Catefory

Diffusion

## Mode

Full-Stack

## User Prompt

Fit diffusion tensor model and compute FA, MD, RD, AD maps

## Input Data Ref

Custom DWI data

## Context Block

Model water diffusion as ellipsoid to get metrics like fractional anisotropy (white matter integrity)

## Expected Capability

diffusion_tensor_tool; dipy_tool

## Acceptance Metrics

dti_fitted; fa_map_generated

## Evidence Required

dti_FA.nii.gz; dti_MD.nii.gz; dti_tensors.nii.gz

