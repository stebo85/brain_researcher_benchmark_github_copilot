# SEG-003: Perform hippocampus subfield segmentation on ABIDE structural scans

## Task Id

SEG-003

## Task Catefory

Segmentation

## Mode

Full-Stack

## User Prompt

Perform hippocampus subfield segmentation on ABIDE structural scans

## Input Data Ref

ABIDE dataset

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Divide hippocampus into detailed subregions (CA1, CA2/3, DG, subiculum) for precise volumetry

## Expected Capability

freesurfer_hippo_tool; subfield_segmentation

## Acceptance Metrics

subfields_segmented; volumes_computed

## Evidence Required

hippocampal-subfields.mgz; subfield_volumes.csv

