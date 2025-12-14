# REG-019: Register atlas labels to Development fMRI native space for ROI analysis

## Task Id

REG-019

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Register atlas labels to Development fMRI native space for ROI analysis

## Input Data Ref

Development fMRI dataset

## Data Key

nilearn.datasets.fetch_development_fmri

## Context Block

Bring standard brain atlas into subject space for extracting signals from regions

## Expected Capability

atlas_registration; inverse_transform

## Acceptance Metrics

labels_in_native; parcellation_complete

## Evidence Required

native_atlas_labels.nii.gz; roi_definitions.csv

