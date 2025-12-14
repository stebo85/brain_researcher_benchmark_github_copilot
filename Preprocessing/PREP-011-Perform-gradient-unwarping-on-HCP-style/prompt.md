# PREP-011: Perform gradient unwarping on HCP-style acquisition

## Task Id

PREP-011

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Perform gradient unwarping on HCP-style acquisition

## Input Data Ref

Custom HCP-style data

## Context Block

Correct for spatial distortions caused by non-linear magnetic field gradients

## Expected Capability

gradient_unwarp_tool; hcp_pipeline

## Acceptance Metrics

unwarping_complete; geometry_restored

## Evidence Required

unwarped_bold.nii.gz; warp_field.nii.gz

