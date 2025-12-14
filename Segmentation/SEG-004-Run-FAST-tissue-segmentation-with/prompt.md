# SEG-004: Run FAST tissue segmentation with bias field correction on NKI T1w

## Task Id

SEG-004

## Task Catefory

Segmentation

## Mode

Full-Stack

## User Prompt

Run FAST tissue segmentation with bias field correction on NKI T1w

## Input Data Ref

NKI Enhanced dataset

## Data Key

nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki

## Context Block

Segment tissues while simultaneously removing intensity inhomogeneity artifacts

## Expected Capability

fsl_fast_tool; bias_correction

## Acceptance Metrics

segmentation_complete; bias_removed

## Evidence Required

fast_seg.nii.gz; bias_field.nii.gz

