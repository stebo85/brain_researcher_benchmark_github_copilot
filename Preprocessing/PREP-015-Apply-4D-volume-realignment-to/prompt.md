# PREP-015: Apply 4D volume realignment to Mixed Gambles timeseries

## Task Id

PREP-015

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Apply 4D volume realignment to Mixed Gambles timeseries

## Input Data Ref

Mixed gambles dataset

## Data Key

nilearn.datasets.fetch_mixed_gambles

## Context Block

Align all volumes in the time series to reduce effects of between-volume motion

## Expected Capability

realignment_tool; motion_correction

## Acceptance Metrics

realignment_complete; rms_motion<0.5mm

## Evidence Required

realigned_bold.nii.gz; realignment_params.txt

