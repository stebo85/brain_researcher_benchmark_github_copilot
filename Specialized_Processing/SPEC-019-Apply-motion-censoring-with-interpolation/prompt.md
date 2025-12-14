# SPEC-019: Apply motion censoring with interpolation for continuous timeseries

## Task Id

SPEC-019

## Task Catefory

Specialized Processing

## Mode

Full-Stack

## User Prompt

Apply motion censoring with interpolation for continuous timeseries

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Remove motion artifacts while maintaining temporal continuity

## Expected Capability

specialized_processing_tool; temporal_decoding_tool

## Acceptance Metrics

motion_censored; timeseries_continuous

## Evidence Required

interpolated_data.nii.gz; censoring_mask.txt

