# REG-010: Perform inverse normalization to bring MNI results back to native space for Miyawaki

## Task Id

REG-010

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Perform inverse normalization to bring MNI results back to native space for Miyawaki

## Input Data Ref

Miyawaki dataset

## Data Key

nilearn.datasets.fetch_miyawaki2008

## Context Block

Apply reverse transformation to project group results onto individual's original brain

## Expected Capability

inverse_warp_tool; native_space_projection

## Acceptance Metrics

inverse_complete; native_space_results

## Evidence Required

native_space_results.nii.gz; inverse_warp.nii.gz

