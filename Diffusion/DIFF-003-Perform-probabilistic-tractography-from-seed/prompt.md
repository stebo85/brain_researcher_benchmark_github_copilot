# DIFF-003: Perform probabilistic tractography from seed regions using FSL BEDPOSTX

## Task Id

DIFF-003

## Task Catefory

Diffusion

## Mode

Full-Stack

## User Prompt

Perform probabilistic tractography from seed regions using FSL BEDPOSTX

## Input Data Ref

Custom DWI preprocessed

## Context Block

Model crossing fibers then trace probabilistic pathways from seed regions through white matter

## Expected Capability

fsl_bedpostx_tool; diffusion_tractography_tool

## Acceptance Metrics

bedpost_converged; streamlines_generated

## Evidence Required

bedpostx/dyads1.nii.gz; tractogram.tck

