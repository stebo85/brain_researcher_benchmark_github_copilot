# PREP-016: Run denoising with global signal regression on ABIDE

## Task Id

PREP-016

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Run denoising with global signal regression on ABIDE

## Input Data Ref

ABIDE dataset

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Remove global brain fluctuations that may represent non-neural noise

## Expected Capability

global_signal_tool; nuisance_regression

## Acceptance Metrics

global_signal_removed; variance_reduced

## Evidence Required

gsr_bold.nii.gz; global_signal_timeseries.txt

