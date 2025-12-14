# ELEC-008: Compute event-related spectral perturbation (ERSP) for theta band

## Task Id

ELEC-008

## Task Catefory

Electrophysiology

## Mode

Full-Stack

## User Prompt

Compute event-related spectral perturbation (ERSP) for theta band

## Input Data Ref

MNE sample dataset

## Data Key

mne.datasets.sample.data_path()

## Context Block

Measure how theta oscillations (4-8 Hz) increase or decrease in power relative to baseline after stimuli

## Expected Capability

mne_timefreq_tool; ersp_analysis

## Acceptance Metrics

ersp_computed; theta_power_modulation

## Evidence Required

ersp_theta.h5; ersp_topomap.png

