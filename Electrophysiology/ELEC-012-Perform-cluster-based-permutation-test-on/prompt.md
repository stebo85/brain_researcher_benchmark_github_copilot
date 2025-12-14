# ELEC-012: Perform cluster-based permutation test on sensor-level data

## Task Id

ELEC-012

## Task Catefory

Electrophysiology

## Mode

Full-Stack

## User Prompt

Perform cluster-based permutation test on sensor-level data

## Input Data Ref

MNE sample dataset

## Data Key

mne.datasets.sample.data_path()

## Context Block

Test for statistical differences between conditions while controlling for multiple comparisons across sensors and time

## Expected Capability

mne_statistics_tool; cluster_permutation

## Acceptance Metrics

clusters_detected; cluster_pvalues<0.05

## Evidence Required

significant_clusters.h5; cluster_plot.png

