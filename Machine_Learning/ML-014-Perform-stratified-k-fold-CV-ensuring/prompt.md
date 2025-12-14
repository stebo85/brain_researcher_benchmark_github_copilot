# ML-014: Perform stratified k-fold CV ensuring balanced classes in ADHD dataset

## Task Id

ML-014

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Perform stratified k-fold CV ensuring balanced classes in ADHD dataset

## Input Data Ref

ADHD-200

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Split data preserving proportion of ADHD vs control in each fold for fair evaluation

## Expected Capability

stratified_cv_tool; classification_tool

## Acceptance Metrics

class_balance_maintained; unbiased_accuracy

## Evidence Required

cv_fold_indices.json; cv_scores_per_fold.csv

