# QC-006: Assess coregistration quality between functional and anatomical in NKI

## Task Id

QC-006

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Assess coregistration quality between functional and anatomical in NKI

## Input Data Ref

NKI Enhanced dataset

## Data Key

nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki

## Context Block

Check how well the functional scan aligns with the structural scan using overlap metrics

## Expected Capability

coreg_qc_tool; alignment_checker

## Acceptance Metrics

alignment_quality_scored; dice>0.85

## Evidence Required

coregistration_qa.png; alignment_metrics.csv

