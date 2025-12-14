# SEG-001: Run FreeSurfer automatic parcellation on OASIS anatomical images

## Task Id

SEG-001

## Task Catefory

Segmentation

## Mode

Full-Stack

## User Prompt

Run FreeSurfer automatic parcellation on OASIS anatomical images

## Input Data Ref

OASIS VBM dataset

## Data Key

nilearn.datasets.fetch_oasis_vbm

## Context Block

Divide cortex into anatomical regions and label subcortical structures using probabilistic atlas

## Expected Capability

freesurfer_tool; aparc_segmentation

## Acceptance Metrics

parcellation_complete; 148_cortical_labels

## Evidence Required

aparc+aseg.mgz; lh.aparc.annot; rh.aparc.annot

