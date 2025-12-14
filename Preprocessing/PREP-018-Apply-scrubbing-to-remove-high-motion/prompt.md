# PREP-018: Apply scrubbing to remove high-motion volumes from Development fMRI

## Task Id

PREP-018

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Apply scrubbing to remove high-motion volumes from Development fMRI

## Input Data Ref

Development fMRI dataset

## Data Key

nilearn.datasets.fetch_development_fmri

## Context Block

Identify and censor volumes with excessive motion rather than using them in analysis

## Expected Capability

scrubbing_tool; motion_censoring

## Acceptance Metrics

high_motion_censored; fd_threshold=0.5mm

## Evidence Required

scrubbed_bold.nii.gz; censoring_mask.txt

