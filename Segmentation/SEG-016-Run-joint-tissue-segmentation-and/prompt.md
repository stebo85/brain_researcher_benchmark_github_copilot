# SEG-016: Run joint tissue segmentation and bias correction on NKI

## Task Id

SEG-016

## Task Catefory

Segmentation

## Mode

Full-Stack

## User Prompt

Run joint tissue segmentation and bias correction on NKI

## Input Data Ref

NKI Enhanced dataset

## Data Key

nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki

## Context Block

Simultaneously classify tissues and remove intensity artifacts in unified model

## Expected Capability

unified_segmentation_tool; joint_correction

## Acceptance Metrics

tissues_segmented; bias_removed

## Evidence Required

tissue_probs/; bias_corrected.nii.gz

