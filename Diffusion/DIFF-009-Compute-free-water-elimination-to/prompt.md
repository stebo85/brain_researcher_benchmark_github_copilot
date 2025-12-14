# DIFF-009: Compute free water elimination to separate tissue from CSF contamination

## Task Id

DIFF-009

## Task Catefory

Diffusion

## Mode

Full-Stack

## User Prompt

Compute free water elimination to separate tissue from CSF contamination

## Input Data Ref

Custom DWI data

## Context Block

Remove CSF partial volume effects to get cleaner white matter diffusion measures

## Expected Capability

fwe_tool; dipy_tool

## Acceptance Metrics

fwe_corrected; tissue_fraction_map

## Evidence Required

fwe_FA.nii.gz; fwe_fraction.nii.gz

