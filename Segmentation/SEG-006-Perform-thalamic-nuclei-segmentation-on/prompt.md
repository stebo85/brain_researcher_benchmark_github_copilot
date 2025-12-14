# SEG-006: Perform thalamic nuclei segmentation on Development fMRI anatomicals

## Task Id

SEG-006

## Task Catefory

Segmentation

## Mode

Full-Stack

## User Prompt

Perform thalamic nuclei segmentation on Development fMRI anatomicals

## Input Data Ref

Development fMRI dataset

## Data Key

nilearn.datasets.fetch_development_fmri

## Context Block

Subdivide thalamus into constituent nuclei using probabilistic atlas registration

## Expected Capability

thalamic_nuclei_tool; fine_segmentation

## Acceptance Metrics

nuclei_segmented; 15_subnuclei

## Evidence Required

thalamic_nuclei.nii.gz; nuclei_volumes.csv

