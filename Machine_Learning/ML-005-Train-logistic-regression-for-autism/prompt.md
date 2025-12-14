# ML-005: Train logistic regression for autism classification on ABIDE resting-state

## Task Id

ML-005

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Train logistic regression for autism classification on ABIDE resting-state

## Input Data Ref

ABIDE functional connectivity

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Build linear classifier with L2 regularization to predict autism from connectivity patterns

## Expected Capability

logistic_regression_tool; classification_tool

## Acceptance Metrics

auc>0.7; calibrated_probabilities

## Evidence Required

trained_lr.pkl; roc_curve.png; predictions.csv

