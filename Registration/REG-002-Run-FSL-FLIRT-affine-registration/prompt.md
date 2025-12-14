# REG-002: Run FSL FLIRT affine registration for ADHD-200 functional to structural

## Task Id

REG-002

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Run FSL FLIRT affine registration for ADHD-200 functional to structural

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Align functional scans to anatomical using 12-parameter linear transformation

## Expected Capability

flirt_tool; affine_registration

## Acceptance Metrics

coregistration_complete; cost_function_minimized

## Evidence Required

flirt_matrix.mat; coregistered_bold.nii.gz

