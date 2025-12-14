# QC-004: Generate framewise displacement timeseries for Development fMRI

## Task Id

QC-004

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Generate framewise displacement timeseries for Development fMRI

## Input Data Ref

Development fMRI dataset

## Data Key

nilearn.datasets.fetch_development_fmri

## Context Block

Measure how much the head moved from one volume to the next throughout the scan

## Expected Capability

fd_tool; motion_qc

## Acceptance Metrics

fd_timeseries_generated; mean_fd<0.3mm

## Evidence Required

fd_timeseries.txt; fd_plot.png

