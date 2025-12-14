# ELEC-013: Calculate cross-frequency coupling between theta phase and gamma amplitude

## Task Id

ELEC-013

## Task Catefory

Electrophysiology

## Mode

Full-Stack

## User Prompt

Calculate cross-frequency coupling between theta phase and gamma amplitude

## Input Data Ref

MNE sample dataset

## Data Key

mne.datasets.sample.data_path()

## Context Block

Measure if gamma power is modulated by the phase of slower theta oscillations (phase-amplitude coupling)

## Expected Capability

mne_connectivity_tool; pac_analysis

## Acceptance Metrics

pac_computed; coupling_strength_significant

## Evidence Required

pac_values.npy; comodulogram.png

