# SPEC-012: Run scrubbing to remove high-motion volumes from ABIDE data

## Task Id

SPEC-012

## Task Catefory

Specialized Processing

## Mode

Full-Stack

## User Prompt

Run scrubbing to remove high-motion volumes from ABIDE data

## Input Data Ref

ABIDE dataset

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Censor timepoints exceeding motion thresholds

## Expected Capability

specialized_processing_tool; connectivity_tool

## Acceptance Metrics

high_motion_censored; connectivity_qc_improved

## Evidence Required

censored_indices.txt; qc_metrics.csv

