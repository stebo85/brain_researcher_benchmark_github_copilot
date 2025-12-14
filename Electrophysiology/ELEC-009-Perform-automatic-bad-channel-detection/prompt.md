# ELEC-009: Perform automatic bad channel detection using autoreject on epochs

## Task Id

ELEC-009

## Task Catefory

Electrophysiology

## Mode

Full-Stack

## User Prompt

Perform automatic bad channel detection using autoreject on epochs

## Input Data Ref

MNE sample dataset

## Data Key

mne.datasets.sample.data_path()

## Context Block

Automatically identify and mark problematic MEG sensors that have excessive noise or artifacts

## Expected Capability

mne_autoreject_tool; quality_control

## Acceptance Metrics

bad_channels_detected; rejection_threshold_computed

## Evidence Required

autoreject_log.pkl; bad_channels.txt

