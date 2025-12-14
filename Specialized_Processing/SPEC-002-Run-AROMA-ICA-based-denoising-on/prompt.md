# SPEC-002: Run AROMA ICA-based denoising on Haxby data

## Task Id

SPEC-002

## Task Catefory

Specialized Processing

## Mode

Full-Stack

## User Prompt

Run AROMA ICA-based denoising on Haxby data

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Automatically identify and remove motion-related ICA components

## Expected Capability

fsl_melodic_tool; specialized_processing_tool

## Acceptance Metrics

motion_components_removed; signal_preserved

## Evidence Required

denoised_bold.nii.gz; classified_components.txt

