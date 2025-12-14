# CLIN-001: Classify ADHD vs controls using resting-state connectivity features

## Task Id

CLIN-001

## Task Catefory

Clinical Analysis

## Mode

Full-Stack

## User Prompt

Classify ADHD vs controls using resting-state connectivity features

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Build diagnostic classifier from brain network patterns to aid clinical assessment

## Expected Capability

mvpa_tool; clinical_decision_support

## Acceptance Metrics

balanced_accuracy>0.65; auc>0.7

## Evidence Required

roc_curve.png; confusion_matrix.png; feature_importance.csv

