# PREP-001: Run fMRIPrep on Haxby dataset with FreeSurfer surface reconstruction

## Task Id

PREP-001

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Run fMRIPrep on Haxby dataset with FreeSurfer surface reconstruction

## Input Data Ref

Haxby dataset

## Data Key

openneuro ds000105 or nilearn.datasets.fetch_haxby

## Context Block

Clean up raw fMRI data with motion correction, distortion correction, normalize to standard space, and reconstruct cortical surfaces

## Expected Capability

fmriprep_tool; freesurfer_tool

## Acceptance Metrics

preprocessing_complete; surfaces_reconstructed

## Evidence Required

sub-*/func/*_space-MNI_bold.nii.gz; sub-*/anat/surf/

