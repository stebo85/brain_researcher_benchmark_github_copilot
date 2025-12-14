# HARM-001: Apply ComBat harmonization to remove site effects from ABIDE resting-state data

## Task Id

HARM-001

## Task Catefory

Data Harmonization

## Mode

Full-Stack

## User Prompt

Apply ComBat harmonization to remove site effects from ABIDE resting-state data

## Input Data Ref

ABIDE dataset

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Remove systematic differences between scanning sites while preserving biological variation

## Expected Capability

data_harmonization_tool

## Acceptance Metrics

site_effects_removed; biological_variance_preserved

## Evidence Required

harmonized_data.npy; site_variance_before_after.csv

