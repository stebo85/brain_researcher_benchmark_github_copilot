# QC-010: Run brain coverage check on Mixed Gambles acquisition

## Task Id

QC-010

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Run brain coverage check on Mixed Gambles acquisition

## Input Data Ref

Mixed gambles dataset

## Data Key

nilearn.datasets.fetch_mixed_gambles

## Context Block

Verify that field of view includes all relevant brain regions without cutoff

## Expected Capability

coverage_checker; acquisition_qc

## Acceptance Metrics

coverage_verified; no_cutoff

## Evidence Required

coverage_map.nii.gz; coverage_report.txt

