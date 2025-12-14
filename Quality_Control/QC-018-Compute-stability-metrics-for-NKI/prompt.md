# QC-018: Compute stability metrics for NKI test-retest subjects

## Task Id

QC-018

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Compute stability metrics for NKI test-retest subjects

## Input Data Ref

NKI Enhanced dataset

## Data Key

nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki

## Context Block

Measure how consistent brain activations are across multiple scanning sessions

## Expected Capability

reliability_tool; retest_qc

## Acceptance Metrics

icc_computed; stability_high

## Evidence Required

reliability_metrics.csv; icc_maps.nii.gz

