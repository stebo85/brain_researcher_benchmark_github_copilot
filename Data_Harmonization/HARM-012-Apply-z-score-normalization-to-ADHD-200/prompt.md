# HARM-012: Apply z-score normalization to ADHD-200 within-scanner batches

## Task Id

HARM-012

## Task Catefory

Data Harmonization

## Mode

Full-Stack

## User Prompt

Apply z-score normalization to ADHD-200 within-scanner batches

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Standardize signal intensity within each scanner separately

## Expected Capability

data_harmonization_tool

## Acceptance Metrics

within_scanner_normalized; between_scanner_preserved

## Evidence Required

normalized_data.npy; normalization_params.json

