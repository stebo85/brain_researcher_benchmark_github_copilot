# PREP-013: Run AFNI 3dDespike to remove extreme outliers from ADHD data

## Task Id

PREP-013

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Run AFNI 3dDespike to remove extreme outliers from ADHD data

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Detect and fix sudden intensity spikes caused by scanner artifacts or motion

## Expected Capability

despike_tool; outlier_detection

## Acceptance Metrics

spikes_removed; timeseries_smooth

## Evidence Required

despiked_bold.nii.gz; spike_report.txt

