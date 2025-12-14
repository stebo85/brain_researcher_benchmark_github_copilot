# ELEC-001: Preprocess MNE sample MEG data with maxwell filtering and artifact removal

## Task Id

ELEC-001

## Task Catefory

Electrophysiology

## Mode

Full-Stack

## User Prompt

Preprocess MNE sample MEG data with maxwell filtering and artifact removal

## Input Data Ref

MNE sample dataset

## Data Key

mne.datasets.sample.data_path()

## Context Block

Clean up raw MEG signals by removing environmental magnetic interference and biological artifacts like heartbeats

## Expected Capability

mne_preprocessing_tool; mne_autoreject_tool

## Acceptance Metrics

maxwell_filtering_applied; artifacts_rejected

## Evidence Required

clean_raw.fif; preprocessing_report.html

