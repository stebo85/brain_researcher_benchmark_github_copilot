# PREP-014: Perform grand mean scaling on Brainomics group data

## Task Id

PREP-014

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Perform grand mean scaling on Brainomics group data

## Input Data Ref

Brainomics Localizer dataset

## Data Key

nilearn.datasets.fetch_localizer_contrasts

## Context Block

Scale all subjects' intensities to same average value so group statistics are comparable

## Expected Capability

scaling_tool; intensity_standardization

## Acceptance Metrics

scaling_applied; mean_value=10000

## Evidence Required

scaled_bold.nii.gz; scaling_factors.csv

