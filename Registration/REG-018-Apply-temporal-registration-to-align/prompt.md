# REG-018: Apply temporal registration to align cardiac phase across SPM auditory volumes

## Task Id

REG-018

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Apply temporal registration to align cardiac phase across SPM auditory volumes

## Input Data Ref

SPM auditory dataset

## Data Key

nilearn.datasets.fetch_spm_auditory

## Context Block

Synchronize acquisition timing with heartbeat to reduce physiological noise

## Expected Capability

cardiac_registration; retrospective_gating

## Acceptance Metrics

cardiac_aligned; noise_reduced

## Evidence Required

phase_aligned_bold.nii.gz; cardiac_timings.txt

