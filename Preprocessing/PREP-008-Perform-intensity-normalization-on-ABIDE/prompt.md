# PREP-008: Perform intensity normalization on ABIDE T1w images

## Task Id

PREP-008

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Perform intensity normalization on ABIDE T1w images

## Input Data Ref

ABIDE dataset

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Standardize image brightness across subjects and scanners for fair comparison

## Expected Capability

intensity_normalization_tool; n4_correction

## Acceptance Metrics

intensities_normalized; histogram_matched

## Evidence Required

normalized_T1w.nii.gz; normalization_stats.csv

