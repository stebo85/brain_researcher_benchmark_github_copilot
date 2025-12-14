# SPEC-008: Run phase-based motion correction for sub-voxel displacement

## Task Id

SPEC-008

## Task Catefory

Specialized Processing

## Mode

Full-Stack

## User Prompt

Run phase-based motion correction for sub-voxel displacement

## Input Data Ref

NKI Enhanced dataset

## Data Key

nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki

## Context Block

Use phase information for more accurate motion correction

## Expected Capability

specialized_processing_tool

## Acceptance Metrics

sub_voxel_motion_corrected; phase_consistency_improved

## Evidence Required

motion_corrected.nii.gz; displacement_params.csv

