# QC-017: Run intensity uniformity check on OASIS T1w images

## Task Id

QC-017

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Run intensity uniformity check on OASIS T1w images

## Input Data Ref

OASIS VBM dataset

## Data Key

nilearn.datasets.fetch_oasis_vbm

## Context Block

Verify consistent brightness across field of view indicating good RF coil performance

## Expected Capability

uniformity_checker; acquisition_qc

## Acceptance Metrics

uniformity_assessed; coefficient<0.15

## Evidence Required

uniformity_map.nii.gz; uniformity_stats.csv

