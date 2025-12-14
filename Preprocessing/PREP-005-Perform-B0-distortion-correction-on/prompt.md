# PREP-005: Perform B0 distortion correction on Miyawaki visual data

## Task Id

PREP-005

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Perform B0 distortion correction on Miyawaki visual data

## Input Data Ref

Miyawaki dataset

## Data Key

openneuro ds006661 or nilearn.datasets.fetch_miyawaki2008

## Context Block

Fix geometric distortions caused by magnetic field inhomogeneities near air-tissue boundaries

## Expected Capability

distortion_correction_tool; fieldmap_tool

## Acceptance Metrics

distortion_corrected; geometry_improved

## Evidence Required

undistorted_bold.nii.gz; fieldmap.nii.gz

