# PREP-009: Apply temporal filtering (0.01-0.1 Hz) to NKI resting-state

## Task Id

PREP-009

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Apply temporal filtering (0.01-0.1 Hz) to NKI resting-state

## Input Data Ref

NKI Enhanced dataset

## Data Key

nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki

## Context Block

Keep only slow fluctuations relevant for resting-state networks by filtering out high frequencies

## Expected Capability

temporal_filter_tool; bandpass

## Acceptance Metrics

filtered_timeseries; frequency_verified

## Evidence Required

filtered_bold.nii.gz; power_spectrum.png

