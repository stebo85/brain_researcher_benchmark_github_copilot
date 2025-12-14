# ML-002: Build random forest model to predict ADHD diagnosis from connectivity

## Task Id

ML-002

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Build random forest model to predict ADHD diagnosis from connectivity

## Input Data Ref

ADHD-200 connectivity

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Train ensemble of decision trees on brain connectivity features to classify ADHD vs control

## Expected Capability

random_forest_tool; classification_tool

## Acceptance Metrics

balanced_accuracy>0.65; feature_importance_ranked

## Evidence Required

trained_rf.pkl; feature_importance.csv

