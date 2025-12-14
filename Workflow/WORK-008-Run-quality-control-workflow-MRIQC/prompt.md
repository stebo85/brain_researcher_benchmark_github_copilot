# WORK-008: Run quality control workflow: MRIQC on all subjects, flag outliers, generate report

## Task Id

WORK-008

## Task Catefory

Workflow

## Mode

Full-Stack

## User Prompt

Run quality control workflow: MRIQC on all subjects, flag outliers, generate report

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Automated QC pipeline with outlier detection across multiple subjects

## Expected Capability

mriqc_tool; qc_tools

## Acceptance Metrics

all_subjects_qc; outliers_flagged

## Evidence Required

mriqc_group.html; outliers.txt

