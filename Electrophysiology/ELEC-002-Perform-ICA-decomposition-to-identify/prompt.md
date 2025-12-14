# ELEC-002: Perform ICA decomposition to identify eye blink components in MNE sample

## Task Id

ELEC-002

## Task Catefory

Electrophysiology

## Mode

Full-Stack

## User Prompt

Perform ICA decomposition to identify eye blink components in MNE sample

## Input Data Ref

MNE sample dataset

## Data Key

mne.datasets.sample.data_path()

## Context Block

Separate mixed MEG signals into independent sources to isolate and remove eye movement artifacts

## Expected Capability

mne_ica_tool; artifact_detection

## Acceptance Metrics

ica_components_extracted; blink_components_identified

## Evidence Required

ica_solution.fif; component_topographies.png

