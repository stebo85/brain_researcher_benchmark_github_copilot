# REG-005: Run multi-modal registration of T1w to T2w for SPM multimodal

## Task Id

REG-005

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Run multi-modal registration of T1w to T2w for SPM multimodal

## Input Data Ref

SPM multimodal dataset

## Data Key

nilearn.datasets.fetch_spm_multimodal_fmri

## Context Block

Align images from different MRI sequences accounting for contrast differences

## Expected Capability

multimodal_registration; spm_coreg

## Acceptance Metrics

modalities_aligned; mutual_information_max

## Evidence Required

t1_to_t2_matrix.mat; coregistered_t1.nii.gz

