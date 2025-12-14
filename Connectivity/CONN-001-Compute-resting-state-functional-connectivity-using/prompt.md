# CONN-001: Compute resting-state functional connectivity using MSDL atlas on ADHD dataset

## Task Id

CONN-001

## Task Catefory

Connectivity

## Mode

Full-Stack

## User Prompt

Compute resting-state functional connectivity using MSDL atlas on ADHD dataset

## Input Data Ref

ADHD-200

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Calculate how brain regions communicate during rest using a 39-region atlas to compare ADHD vs control subjects

## Expected Capability

conn_tool; dynamic_connectivity_tool

## Acceptance Metrics

matrix_39x39_generated; group_differences_detected

## Evidence Required

connectivity_matrix.npy; group_comparison.csv

