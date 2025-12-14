# DATA-002: Load and cache ADHD-200 dataset with phenotypic data

## Task Id

DATA-002

## Task Catefory

Data Management

## Mode

Full-Stack

## User Prompt

Load and cache ADHD-200 dataset with phenotypic data

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Download the dataset and save phenotype information like age, sex, diagnosis for fast future access

## Expected Capability

data_management_tool; cache_tool

## Acceptance Metrics

data_cached; phenotypes_loaded

## Evidence Required

cached_data.pkl; phenotypes.csv

