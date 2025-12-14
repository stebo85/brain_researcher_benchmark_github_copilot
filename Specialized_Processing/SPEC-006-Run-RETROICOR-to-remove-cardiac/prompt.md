# SPEC-006: Run RETROICOR to remove cardiac and respiratory artifacts

## Task Id

SPEC-006

## Task Catefory

Specialized Processing

## Mode

Full-Stack

## User Prompt

Run RETROICOR to remove cardiac and respiratory artifacts

## Input Data Ref

Custom physio-monitored fMRI

## Context Block

Use physiological recordings to model and remove periodic noise

## Expected Capability

specialized_processing_tool

## Acceptance Metrics

physio_regressors_created; periodic_noise_removed

## Evidence Required

retroicor_regressors.csv; denoised_bold.nii.gz

