# QC-003: Compute temporal SNR maps for Brainomics Localizer data

## Task Id

QC-003

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Compute temporal SNR maps for Brainomics Localizer data

## Input Data Ref

Brainomics Localizer dataset

## Data Key

nilearn.datasets.fetch_localizer_contrasts

## Context Block

Calculate signal-to-noise ratio at each voxel over time to identify problematic brain regions

## Expected Capability

tsnr_tool; qc_metrics

## Acceptance Metrics

tsnr_maps_generated; mean_tsnr>50

## Evidence Required

tsnr_map.nii.gz; tsnr_histogram.png

