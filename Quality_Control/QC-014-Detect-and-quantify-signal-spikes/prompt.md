# QC-014: Detect and quantify signal spikes in ADHD-200 timeseries

## Task Id

QC-014

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Detect and quantify signal spikes in ADHD-200 timeseries

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Find sudden intensity jumps that indicate scanner glitches or severe motion

## Expected Capability

spike_detector_tool; timeseries_qc

## Acceptance Metrics

spikes_quantified; outlier_volumes_flagged

## Evidence Required

spike_report.txt; spike_timeseries.png

