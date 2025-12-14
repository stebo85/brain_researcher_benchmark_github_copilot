# QC-011: Assess signal dropout in orbitofrontal cortex for FIAC data

## Task Id

QC-011

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Assess signal dropout in orbitofrontal cortex for FIAC data

## Input Data Ref

FIAC dataset

## Data Key

nilearn.datasets.fetch_fiac_first_level

## Context Block

Check for signal loss in susceptibility-prone regions near sinuses

## Expected Capability

dropout_checker; susceptibility_qc

## Acceptance Metrics

dropout_assessed; severity_mapped

## Evidence Required

dropout_map.nii.gz; ofc_signal_quality.csv

