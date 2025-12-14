# STAT-006: Apply FDR correction to Miyawaki decoding searchlight results

## Task Id

STAT-006

## Task Catefory

Statistical Analysis

## Mode

Full-Stack

## User Prompt

Apply FDR correction to Miyawaki decoding searchlight results

## Input Data Ref

Miyawaki dataset

## Data Key

nilearn.datasets.fetch_miyawaki2008

## Context Block

Control false discovery rate across multiple comparisons for spatial maps

## Expected Capability

fdr_correction_tool; multiple_comparisons

## Acceptance Metrics

fdr_applied; q<0.05

## Evidence Required

fdr_corrected_map.nii.gz; significant_voxels.txt

