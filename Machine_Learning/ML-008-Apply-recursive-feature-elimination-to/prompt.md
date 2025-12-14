# ML-008: Apply recursive feature elimination to find most informative voxels for decoding

## Task Id

ML-008

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Apply recursive feature elimination to find most informative voxels for decoding

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Iteratively remove least important voxels while tracking classification performance

## Expected Capability

rfe_tool; feature_selection_tool

## Acceptance Metrics

optimal_n_features_found; accuracy_maximized

## Evidence Required

selected_voxels_mask.nii.gz; rfe_scores.csv

