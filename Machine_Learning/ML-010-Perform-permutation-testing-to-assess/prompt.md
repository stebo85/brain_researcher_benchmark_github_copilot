# ML-010: Perform permutation testing to assess statistical significance of decoder

## Task Id

ML-010

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Perform permutation testing to assess statistical significance of decoder

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Shuffle labels many times to build null distribution and test if accuracy is above chance

## Expected Capability

permutation_testing_tool; statistical_validation

## Acceptance Metrics

p_value<0.05; null_distribution_generated

## Evidence Required

permutation_pvalues.csv; null_histogram.png

