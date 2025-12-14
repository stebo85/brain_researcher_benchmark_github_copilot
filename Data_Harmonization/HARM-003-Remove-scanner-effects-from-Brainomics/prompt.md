# HARM-003: Remove scanner effects from Brainomics Localizer using linear mixed models

## Task Id

HARM-003

## Task Catefory

Data Harmonization

## Mode

Full-Stack

## User Prompt

Remove scanner effects from Brainomics Localizer using linear mixed models

## Input Data Ref

Brainomics Localizer

## Data Key

nilearn.datasets.fetch_localizer_contrasts

## Context Block

Model scanner as random effect and remove its contribution statistically

## Expected Capability

mixed_effects_tool; data_harmonization_tool

## Acceptance Metrics

random_effects_removed; fixed_effects_preserved

## Evidence Required

harmonized_contrasts.nii.gz; variance_components.csv

