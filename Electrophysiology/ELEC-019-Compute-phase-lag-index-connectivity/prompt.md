# ELEC-019: Compute phase lag index connectivity to assess true interactions

## Task Id

ELEC-019

## Task Catefory

Electrophysiology

## Mode

Full-Stack

## User Prompt

Compute phase lag index connectivity to assess true interactions

## Input Data Ref

MNE sample dataset

## Data Key

mne.datasets.sample.data_path()

## Context Block

Measure non-zero phase lag connectivity that must reflect true interactions not instantaneous mixing

## Expected Capability

mne_connectivity_tool; pli_analysis

## Acceptance Metrics

pli_matrix_computed; significant_edges_detected

## Evidence Required

pli_connectivity.npy; pli_circle_plot.png

