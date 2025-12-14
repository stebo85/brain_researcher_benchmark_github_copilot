# QC-007: Compute spatial smoothness estimates for ABIDE preprocessed data

## Task Id

QC-007

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Compute spatial smoothness estimates for ABIDE preprocessed data

## Input Data Ref

ABIDE dataset

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Measure how smooth the data is to ensure preprocessing didn't over-blur images

## Expected Capability

smoothness_estimator; qc_metrics

## Acceptance Metrics

fwhm_estimated; smoothness_documented

## Evidence Required

smoothness_estimates.txt; fwhm_map.nii.gz

