# ELEC-018: Perform temporal response function (TRF) analysis on continuous data

## Task Id

ELEC-018

## Task Catefory

Electrophysiology

## Mode

Full-Stack

## User Prompt

Perform temporal response function (TRF) analysis on continuous data

## Input Data Ref

MNE sample dataset

## Data Key

mne.datasets.sample.data_path()

## Context Block

Build encoding models that predict MEG responses from stimulus features over time lags

## Expected Capability

mne_encoding_tool; trf_analysis

## Acceptance Metrics

trf_model_fitted; prediction_accuracy_significant

## Evidence Required

trf_weights.npy; predicted_response.fif

