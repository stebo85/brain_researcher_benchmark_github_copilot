# REG-006: Perform symmetric group template construction from ABIDE controls

## Task Id

REG-006

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Perform symmetric group template construction from ABIDE controls

## Input Data Ref

ABIDE dataset

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Build unbiased average brain by iteratively registering all subjects together

## Expected Capability

ants_buildtemplate; groupwise_registration

## Acceptance Metrics

template_created; unbiased_average

## Evidence Required

group_template.nii.gz; subject_warps/

