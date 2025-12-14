# META-018: Perform permutation-based thresholding for meta-analytic maps

## Task Id

META-018

## Task Catefory

Meta-Analysis

## Mode

Full-Stack

## User Prompt

Perform permutation-based thresholding for meta-analytic maps

## Input Data Ref

Combined ALE map

## Context Block

Use non-parametric stats to threshold meta-analysis at family-wise error rate

## Expected Capability

permutation_testing_tool

## Acceptance Metrics

fwe_threshold; permutation_n=10000

## Evidence Required

fwe_corrected_ale.nii.gz; null_distribution.png

