# CLIN-005: Calculate brain age gap from structural MRI using trained model

## Task Id

CLIN-005

## Task Catefory

Clinical Analysis

## Mode

Full-Stack

## User Prompt

Calculate brain age gap from structural MRI using trained model

## Input Data Ref

OASIS VBM dataset

## Data Key

nilearn.datasets.fetch_oasis_vbm

## Context Block

Predict biological brain age and compare to chronological age as health marker

## Expected Capability

dl_pytorch_tool; clinical_decision_support

## Acceptance Metrics

age_mae<5years; brain_age_gap_computed

## Evidence Required

predicted_ages.csv; age_gap_distribution.png

