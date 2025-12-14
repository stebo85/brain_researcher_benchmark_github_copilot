# REG-012: Register MNE MEG source space to individual FreeSurfer surfaces

## Task Id

REG-012

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Register MNE MEG source space to individual FreeSurfer surfaces

## Input Data Ref

MNE sample dataset

## Data Key

mne.datasets.sample.data_path()

## Context Block

Align MEG source model to subject's cortical surface for accurate localization

## Expected Capability

mne_registration; source_space_alignment

## Acceptance Metrics

source_space_registered; distances_minimized

## Evidence Required

src-bem.fif; trans.fif

