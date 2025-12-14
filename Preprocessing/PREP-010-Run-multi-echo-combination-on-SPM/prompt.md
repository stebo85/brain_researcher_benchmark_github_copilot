# PREP-010: Run multi-echo combination on SPM multimodal data

## Task Id

PREP-010

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Run multi-echo combination on SPM multimodal data

## Input Data Ref

SPM multimodal dataset

## Data Key

nilearn.datasets.fetch_spm_multimodal_fmri

## Context Block

Optimally combine images acquired at different echo times to maximize signal quality

## Expected Capability

multiecho_tool; tedana

## Acceptance Metrics

combined_echo; tedana_metrics

## Evidence Required

combined_bold.nii.gz; t2star_map.nii.gz

