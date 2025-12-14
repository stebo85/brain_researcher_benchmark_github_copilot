# REG-007: Apply boundary-based registration for Brainomics functional-structural alignment

## Task Id

REG-007

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Apply boundary-based registration for Brainomics functional-structural alignment

## Input Data Ref

Brainomics Localizer dataset

## Data Key

nilearn.datasets.fetch_localizer_contrasts

## Context Block

Use white matter boundary to improve functional-anatomical registration accuracy

## Expected Capability

bbr_tool; boundary_registration

## Acceptance Metrics

bbr_complete; boundary_matched

## Evidence Required

bbr_matrix.mat; registered_bold.nii.gz

