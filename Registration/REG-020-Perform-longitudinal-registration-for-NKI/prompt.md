# REG-020: Perform longitudinal registration for NKI subjects with repeated scans

## Task Id

REG-020

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Perform longitudinal registration for NKI subjects with repeated scans

## Input Data Ref

NKI Enhanced dataset

## Data Key

nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki

## Context Block

Create within-subject template and register multiple timepoints for stability

## Expected Capability

longitudinal_pipeline; within_subject

## Acceptance Metrics

longitudinal_complete; subject_template_created

## Evidence Required

longitudinal_template.nii.gz; timepoint_warps/

