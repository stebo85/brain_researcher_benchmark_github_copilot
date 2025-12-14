# QC-009: Calculate DVARS for physiological noise assessment in Miyawaki

## Task Id

QC-009

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Calculate DVARS for physiological noise assessment in Miyawaki

## Input Data Ref

Miyawaki dataset

## Data Key

nilearn.datasets.fetch_miyawaki2008

## Context Block

Measure rate of change of BOLD signal to detect physiological artifacts like respiration

## Expected Capability

dvars_tool; noise_qc

## Acceptance Metrics

dvars_computed; spikes_detected

## Evidence Required

dvars_timeseries.txt; dvars_plot.png

