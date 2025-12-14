# SEG-007: Run brainstem substructure segmentation on OASIS dataset

## Task Id

SEG-007

## Task Catefory

Segmentation

## Mode

Full-Stack

## User Prompt

Run brainstem substructure segmentation on OASIS dataset

## Input Data Ref

OASIS VBM dataset

## Data Key

nilearn.datasets.fetch_oasis_vbm

## Context Block

Label midbrain, pons, medulla and internal structures like substantia nigra

## Expected Capability

brainstem_tool; freesurfer_7.2

## Acceptance Metrics

brainstem_segmented; 5_substructures

## Evidence Required

brainstem_structures.mgz; structure_volumes.csv

