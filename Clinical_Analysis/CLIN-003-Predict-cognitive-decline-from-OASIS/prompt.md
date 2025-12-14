# CLIN-003: Predict cognitive decline from OASIS brain volumes using ML

## Task Id

CLIN-003

## Task Catefory

Clinical Analysis

## Mode

Full-Stack

## User Prompt

Predict cognitive decline from OASIS brain volumes using ML

## Input Data Ref

OASIS VBM dataset

## Data Key

nilearn.datasets.fetch_oasis_vbm

## Context Block

Train model to forecast dementia progression from baseline brain structure

## Expected Capability

dl_pytorch_tool; clinical_decision_support

## Acceptance Metrics

prediction_mae<5_mmse_points; ci_computed

## Evidence Required

predictions.csv; feature_importance.png

