# ML-009: Train gradient boosting model on HCP connectivity to predict fluid intelligence

## Task Id

ML-009

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Train gradient boosting model on HCP connectivity to predict fluid intelligence

## Input Data Ref

HCP MegaTrawls + behavior

## Data Key

nilearn.datasets.fetch_megatrawls_netmats

## Context Block

Build ensemble of weak learners that sequentially correct each other's errors

## Expected Capability

gradient_boosting_tool; regression_tool

## Acceptance Metrics

prediction_r>0.3; feature_interactions_captured

## Evidence Required

trained_gbm.pkl; intelligence_predictions.csv

