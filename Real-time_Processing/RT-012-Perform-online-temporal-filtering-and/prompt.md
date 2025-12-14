# RT-012: Perform online temporal filtering and physiological noise removal

## Task Id

RT-012

## Task Catefory

Real-time Processing

## Mode

Full-Stack

## User Prompt

Perform online temporal filtering and physiological noise removal

## Input Data Ref

Streaming fMRI + physio

## Context Block

Remove breathing and cardiac artifacts in real-time using recorded physiology

## Expected Capability

realtime_fmri_tool

## Acceptance Metrics

bandpass_filtered_online; retroicor_applied

## Evidence Required

filtered_data.nii.gz; physio_regressors.csv

