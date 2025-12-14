# STATINF-020: Perform cross-validated prediction with nested resampling

## Task Id

STATINF-020

## Task Catefory

Statistical Inference

## Mode

Full-Stack

## User Prompt

Perform cross-validated prediction with nested resampling

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Use nested CV to get unbiased estimate of out-of-sample prediction accuracy

## Expected Capability

cross_validation_tool

## Acceptance Metrics

nested_cv_accuracy; unbiased_estimate

## Evidence Required

nested_cv_results.csv; cv_scheme.png

