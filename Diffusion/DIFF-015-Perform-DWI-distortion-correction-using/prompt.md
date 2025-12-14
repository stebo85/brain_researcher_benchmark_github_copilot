# DIFF-015: Perform DWI distortion correction using B0 fieldmaps

## Task Id

DIFF-015

## Task Catefory

Diffusion

## Mode

Full-Stack

## User Prompt

Perform DWI distortion correction using B0 fieldmaps

## Input Data Ref

Custom DWI + fieldmap

## Context Block

Correct geometric distortions caused by magnetic susceptibility using field inhomogeneity maps

## Expected Capability

fsl_topup_tool; distortion_correction

## Acceptance Metrics

distortion_corrected; fieldmap_applied

## Evidence Required

corrected_dwi.nii.gz; displacement_field.nii.gz

