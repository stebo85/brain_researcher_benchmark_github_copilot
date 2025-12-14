# ML-015: Build stacking ensemble combining SVM, RF, and logistic regression predictions

## Task Id

ML-015

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Build stacking ensemble combining SVM, RF, and logistic regression predictions

## Input Data Ref

ABIDE connectivity

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Train meta-model that combines predictions from multiple base learners for better performance

## Expected Capability

ensemble_stacking_tool; meta_learning

## Acceptance Metrics

stacked_accuracy>base_learners; optimal_weights

## Evidence Required

stacked_model.pkl; base_predictions.csv

