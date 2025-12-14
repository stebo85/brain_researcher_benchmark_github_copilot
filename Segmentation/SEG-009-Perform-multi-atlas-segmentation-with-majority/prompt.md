# SEG-009: Perform multi-atlas segmentation with majority voting for Brainomics

## Task Id

SEG-009

## Task Catefory

Segmentation

## Mode

Full-Stack

## User Prompt

Perform multi-atlas segmentation with majority voting for Brainomics

## Input Data Ref

Brainomics Localizer dataset

## Data Key

nilearn.datasets.fetch_localizer_contrasts

## Context Block

Register multiple labeled atlases and combine predictions for robust parcellation

## Expected Capability

multi_atlas_tool; label_fusion

## Acceptance Metrics

consensus_segmentation; voting_weights

## Evidence Required

fused_labels.nii.gz; atlas_contributions.csv

