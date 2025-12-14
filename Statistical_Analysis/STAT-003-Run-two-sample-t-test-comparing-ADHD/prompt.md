# STAT-003: Run two-sample t-test comparing ADHD vs controls on ReHo maps

## Task Id

STAT-003

## Task Catefory

Statistical Analysis

## Mode

Full-Stack

## User Prompt

Run two-sample t-test comparing ADHD vs controls on ReHo maps

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Compare two groups to find regions with different local synchronization using independent samples test

## Expected Capability

statistical_comparison_tool; group_difference

## Acceptance Metrics

two_sample_complete; corrected_p<0.05

## Evidence Required

adhd_vs_control_tmap.nii.gz; significant_clusters.csv

