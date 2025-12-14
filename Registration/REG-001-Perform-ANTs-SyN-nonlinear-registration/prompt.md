# REG-001: Perform ANTs SyN nonlinear registration to MNI152 for Haxby anatomicals

## Task Id

REG-001

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Perform ANTs SyN nonlinear registration to MNI152 for Haxby anatomicals

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Warp individual brain anatomy to match standard template using advanced diffeomorphic algorithm

## Expected Capability

ants_tool; syn_registration

## Acceptance Metrics

registration_complete; jacobian_reasonable

## Evidence Required

registered_T1w.nii.gz; composite_warp.nii.gz

