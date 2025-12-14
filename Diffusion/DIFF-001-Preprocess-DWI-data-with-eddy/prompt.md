# DIFF-001: Preprocess DWI data with eddy current and motion correction

## Task Id

DIFF-001

## Task Catefory

Diffusion

## Mode

Full-Stack

## User Prompt

Preprocess DWI data with eddy current and motion correction

## Input Data Ref

Custom DWI BIDS

## Context Block

Clean up diffusion scans by correcting distortions from eddy currents and subject head movement

## Expected Capability

qsiprep_tool; fsl_eddy

## Acceptance Metrics

eddy_corrected; motion_params_extracted

## Evidence Required

corrected_dwi.nii.gz; eddy_movement.txt

