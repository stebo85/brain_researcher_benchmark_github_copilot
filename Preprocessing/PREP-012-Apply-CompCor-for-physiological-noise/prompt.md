# PREP-012: Apply CompCor for physiological noise removal on Haxby

## Task Id

PREP-012

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Apply CompCor for physiological noise removal on Haxby

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Remove breathing and heartbeat artifacts by modeling noise from white matter and CSF

## Expected Capability

compcor_tool; nuisance_regression

## Acceptance Metrics

physiological_noise_removed; confounds_computed

## Evidence Required

cleaned_bold.nii.gz; compcor_components.tsv

