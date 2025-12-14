# QC-015: Assess T1w/T2w ratio quality for Development fMRI anatomicals

## Task Id

QC-015

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Assess T1w/T2w ratio quality for Development fMRI anatomicals

## Input Data Ref

Development fMRI dataset

## Data Key

nilearn.datasets.fetch_development_fmri

## Context Block

Check structural scan quality using tissue contrast metrics

## Expected Capability

contrast_qc_tool; structural_metrics

## Acceptance Metrics

contrast_assessed; ratio_in_range

## Evidence Required

t1w_t2w_ratio.nii.gz; quality_scores.csv

