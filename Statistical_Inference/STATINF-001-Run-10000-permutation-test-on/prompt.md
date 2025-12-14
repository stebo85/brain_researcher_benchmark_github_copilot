# STATINF-001: Run 10000 permutation test on Haxby face vs house contrast

## Task Id

STATINF-001

## Task Catefory

Statistical Inference

## Mode

Full-Stack

## User Prompt

Run 10000 permutation test on Haxby face vs house contrast

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Test statistical significance by randomly shuffling condition labels many times

## Expected Capability

permutation_testing_tool

## Acceptance Metrics

null_distribution_generated; fwe_corrected_p

## Evidence Required

permutation_pvals.npy; null_histogram.png

