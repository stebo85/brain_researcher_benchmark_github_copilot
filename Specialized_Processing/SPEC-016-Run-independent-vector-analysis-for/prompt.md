# SPEC-016: Run independent vector analysis for group ICA with linked components

## Task Id

SPEC-016

## Task Catefory

Specialized Processing

## Mode

Full-Stack

## User Prompt

Run independent vector analysis for group ICA with linked components

## Input Data Ref

ABIDE dataset

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Perform group ICA maintaining subject-specific variation

## Expected Capability

specialized_processing_tool; fsl_melodic_tool

## Acceptance Metrics

group_components_linked; subject_variation_preserved

## Evidence Required

iva_components.nii.gz; subject_loadings.csv

