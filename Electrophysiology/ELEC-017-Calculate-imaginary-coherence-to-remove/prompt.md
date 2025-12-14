# ELEC-017: Calculate imaginary coherence to remove volume conduction effects

## Task Id

ELEC-017

## Task Catefory

Electrophysiology

## Mode

Full-Stack

## User Prompt

Calculate imaginary coherence to remove volume conduction effects

## Input Data Ref

MNE sample dataset

## Data Key

mne.datasets.sample.data_path()

## Context Block

Measure connectivity using only the imaginary part of coherence to avoid spurious correlations from signal mixing

## Expected Capability

mne_connectivity_tool; coherence_analysis

## Acceptance Metrics

imag_coherence_computed; true_interactions_isolated

## Evidence Required

imag_coh_matrix.npy; connectivity_matrix.png

