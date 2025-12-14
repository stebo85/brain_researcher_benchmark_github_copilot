# REG-015: Apply slice-to-volume registration for motion correction in Mixed Gambles

## Task Id

REG-015

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Apply slice-to-volume registration for motion correction in Mixed Gambles

## Input Data Ref

Mixed gambles dataset

## Data Key

nilearn.datasets.fetch_mixed_gambles

## Context Block

Correct for within-volume motion by aligning individual slices independently

## Expected Capability

slicemoco_tool; intra_volume_correction

## Acceptance Metrics

slice_motion_corrected; slice_alignment_improved

## Evidence Required

corrected_bold.nii.gz; slice_transforms.txt

