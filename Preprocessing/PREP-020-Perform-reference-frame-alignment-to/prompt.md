# PREP-020: Perform reference frame alignment to AC-PC line on OASIS

## Task Id

PREP-020

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Perform reference frame alignment to AC-PC line on OASIS

## Input Data Ref

OASIS VBM dataset

## Data Key

nilearn.datasets.fetch_oasis_vbm

## Context Block

Rotate brain images so they align with standard anatomical landmarks (anterior/posterior commissure)

## Expected Capability

acpc_alignment_tool; rigid_registration

## Acceptance Metrics

acpc_aligned; rotation_minimal

## Evidence Required

acpc_aligned.nii.gz; rotation_matrix.txt

