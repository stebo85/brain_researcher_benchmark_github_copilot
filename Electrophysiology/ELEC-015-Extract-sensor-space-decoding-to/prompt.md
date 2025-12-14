# ELEC-015: Extract sensor space decoding to classify auditory vs visual trials

## Task Id

ELEC-015

## Task Catefory

Electrophysiology

## Mode

Full-Stack

## User Prompt

Extract sensor space decoding to classify auditory vs visual trials

## Input Data Ref

MNE sample dataset

## Data Key

mne.datasets.sample.data_path()

## Context Block

Train classifier to distinguish stimulus types from MEG patterns to test information content at sensors

## Expected Capability

mne_decoding_tool; mvpa_tool

## Acceptance Metrics

decoding_accuracy>0.8; generalization_across_time

## Evidence Required

decoding_scores.csv; gat_matrix.png

