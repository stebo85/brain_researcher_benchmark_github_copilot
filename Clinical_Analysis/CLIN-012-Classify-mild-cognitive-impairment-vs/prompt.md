# CLIN-012: Classify mild cognitive impairment vs Alzheimer's from OASIS

## Task Id

CLIN-012

## Task Catefory

Clinical Analysis

## Mode

Full-Stack

## User Prompt

Classify mild cognitive impairment vs Alzheimer's from OASIS

## Input Data Ref

OASIS VBM dataset

## Data Key

nilearn.datasets.fetch_oasis_vbm

## Context Block

Distinguish early cognitive decline from dementia using brain atrophy patterns

## Expected Capability

mvpa_tool; clinical_decision_support

## Acceptance Metrics

sensitivity>0.75; specificity>0.75

## Evidence Required

mci_classifier.pkl; roc_curves.png

