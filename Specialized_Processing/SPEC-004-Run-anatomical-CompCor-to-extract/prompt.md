# SPEC-004: Run anatomical CompCor to extract physiological noise from Localizer data

## Task Id

SPEC-004

## Task Catefory

Specialized Processing

## Mode

Full-Stack

## User Prompt

Run anatomical CompCor to extract physiological noise from Localizer data

## Input Data Ref

Brainomics Localizer

## Data Key

nilearn.datasets.fetch_localizer_contrasts

## Context Block

Extract principal components from white matter and CSF for denoising

## Expected Capability

specialized_processing_tool; nilearn_glm_tool

## Acceptance Metrics

compcor_regressors_extracted; variance_explained>0.5

## Evidence Required

compcor_regressors.csv; variance_explained.png

