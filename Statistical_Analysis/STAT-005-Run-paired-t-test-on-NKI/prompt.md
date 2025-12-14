# STAT-005: Run paired t-test on NKI test-retest connectivity matrices

## Task Id

STAT-005

## Task Catefory

Statistical Analysis

## Mode

Full-Stack

## User Prompt

Run paired t-test on NKI test-retest connectivity matrices

## Input Data Ref

NKI Enhanced dataset

## Data Key

nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki

## Context Block

Compare same subjects across two sessions to test for systematic differences in measurements

## Expected Capability

paired_test_tool; within_subject

## Acceptance Metrics

paired_complete; difference_map_generated

## Evidence Required

paired_tmap.nii.gz; reliability_metrics.csv

