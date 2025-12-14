# SEG-013: Run white matter lesion segmentation for aging cohort

## Task Id

SEG-013

## Task Catefory

Segmentation

## Mode

Full-Stack

## User Prompt

Run white matter lesion segmentation for aging cohort

## Input Data Ref

OASIS VBM dataset

## Data Key

nilearn.datasets.fetch_oasis_vbm

## Context Block

Detect white matter hyperintensities indicating vascular pathology in elderly

## Expected Capability

wml_segmentation_tool; hyperintensity_detection

## Acceptance Metrics

wml_detected; lesion_load_quantified

## Evidence Required

wml_mask.nii.gz; lesion_burden.csv

