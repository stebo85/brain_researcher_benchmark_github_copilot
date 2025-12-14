# SEG-002: Segment gray matter, white matter, and CSF from ADHD-200 T1w images

## Task Id

SEG-002

## Task Catefory

Segmentation

## Mode

Full-Stack

## User Prompt

Segment gray matter, white matter, and CSF from ADHD-200 T1w images

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Classify each voxel into one of three main tissue types using intensity and spatial priors

## Expected Capability

spm_segment_tool; tissue_classification

## Acceptance Metrics

tissue_maps_generated; probability_sum=1

## Evidence Required

c1_gm.nii.gz; c2_wm.nii.gz; c3_csf.nii.gz

