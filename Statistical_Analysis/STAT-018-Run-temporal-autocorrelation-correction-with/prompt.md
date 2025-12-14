# STAT-018: Run temporal autocorrelation correction with AR(1) model on Haxby

## Task Id

STAT-018

## Task Catefory

Statistical Analysis

## Mode

Full-Stack

## User Prompt

Run temporal autocorrelation correction with AR(1) model on Haxby

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Account for temporal dependencies in fMRI timeseries using autoregressive pre-whitening

## Expected Capability

prewhitening_tool; ar_correction

## Acceptance Metrics

autocorr_corrected; effective_dof

## Evidence Required

prewhitened_residuals.nii.gz; ar_coefficients.txt

