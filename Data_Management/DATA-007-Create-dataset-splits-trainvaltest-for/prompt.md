# DATA-007: Create dataset splits (train/val/test) for NKI Enhanced cohort

## Task Id

DATA-007

## Task Catefory

Data Management

## Mode

Full-Stack

## User Prompt

Create dataset splits (train/val/test) for NKI Enhanced cohort

## Input Data Ref

NKI Enhanced dataset

## Data Key

nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki

## Context Block

Divide subjects into training, validation and test groups while balancing age and sex distribution

## Expected Capability

data_splitting_tool; stratification

## Acceptance Metrics

splits_created; demographics_balanced

## Evidence Required

train_subjects.txt; val_subjects.txt; test_subjects.txt

