# PREP-019: Run resampling to 2mm isotropic resolution for HCP MegaTrawls source data

## Task Id

PREP-019

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Run resampling to 2mm isotropic resolution for HCP MegaTrawls source data

## Input Data Ref

HCP source data

## Context Block

Change voxel size to standard resolution for compatibility with analysis tools

## Expected Capability

resampling_tool; interpolation

## Acceptance Metrics

resampling_complete; voxel_size=2mm

## Evidence Required

resampled_bold.nii.gz; transformation_matrix.txt

