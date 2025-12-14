# WORK-005: Execute MVPA workflow on Haxby: feature selection, cross-validation, searchlight

## Task Id

WORK-005

## Task Catefory

Workflow

## Mode

Full-Stack

## User Prompt

Execute MVPA workflow on Haxby: feature selection, cross-validation, searchlight

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Chain multiple MVPA steps into automated decoding pipeline

## Expected Capability

feature_selection_tool; mvpa_tool; searchlight_tool

## Acceptance Metrics

cv_completed; searchlight_completed

## Evidence Required

cv_scores.csv; searchlight_map.nii.gz

