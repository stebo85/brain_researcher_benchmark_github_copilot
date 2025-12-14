# QC-002: Detect and flag outlier subjects in ADHD-200 based on motion

## Task Id

QC-002

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Detect and flag outlier subjects in ADHD-200 based on motion

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Find subjects with excessive head movement that might need to be excluded from analysis

## Expected Capability

outlier_detection_tool; motion_qc

## Acceptance Metrics

outliers_identified; threshold_applied

## Evidence Required

outlier_subjects.txt; motion_summary.csv

