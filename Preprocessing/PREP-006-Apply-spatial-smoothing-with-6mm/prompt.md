# PREP-006: Apply spatial smoothing with 6mm FWHM to Brainomics Localizer

## Task Id

PREP-006

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Apply spatial smoothing with 6mm FWHM to Brainomics Localizer

## Input Data Ref

Brainomics Localizer dataset

## Data Key

nilearn.datasets.fetch_localizer_contrasts

## Context Block

Blur the images slightly to increase signal-to-noise ratio and account for anatomical variability

## Expected Capability

smoothing_tool; preprocessing

## Acceptance Metrics

smoothing_applied; fwhm_verified

## Evidence Required

smoothed_bold.nii.gz; smoothing_kernel.txt

