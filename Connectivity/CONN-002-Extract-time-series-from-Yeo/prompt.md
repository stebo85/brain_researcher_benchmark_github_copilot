# CONN-002: Extract time series from Yeo 7 networks and compute correlation matrix on NKI data

## Task Id

CONN-002

## Task Catefory

Connectivity

## Mode

Full-Stack

## User Prompt

Extract time series from Yeo 7 networks and compute correlation matrix on NKI data

## Input Data Ref

NKI Enhanced

## Data Key

nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki

## Context Block

Pull out activity timecourses from the 7 major brain networks and see how strongly they correlate with each other

## Expected Capability

connectivity_tool; nilearn_signal_extraction

## Acceptance Metrics

timeseries_extracted; 7x7_correlation_matrix

## Evidence Required

network_timeseries.csv; correlation_matrix.png

