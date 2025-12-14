# SEG-010: Run SPM12 DARTEL segmentation with improved normalization

## Task Id

SEG-010

## Task Catefory

Segmentation

## Mode

Full-Stack

## User Prompt

Run SPM12 DARTEL segmentation with improved normalization

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Use diffeomorphic registration during segmentation for better alignment of atrophied brains

## Expected Capability

spm_dartel_tool; dartel_segmentation

## Acceptance Metrics

dartel_complete; flow_fields_generated

## Evidence Required

dartel_template.nii.gz; flow_fields/

