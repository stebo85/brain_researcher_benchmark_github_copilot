# RT-013: Run real-time spatial smoothing with adaptive kernel

## Task Id

RT-013

## Task Catefory

Real-time Processing

## Mode

Full-Stack

## User Prompt

Run real-time spatial smoothing with adaptive kernel

## Input Data Ref

Streaming fMRI volumes

## Context Block

Apply Gaussian smoothing online with kernel size adjusted to SNR

## Expected Capability

realtime_fmri_tool

## Acceptance Metrics

adaptive_smoothing; optimal_fwhm_selected

## Evidence Required

smoothed_volumes.nii.gz; kernel_log.csv

