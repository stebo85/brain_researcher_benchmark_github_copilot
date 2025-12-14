# QC-001: Run MRIQC on Haxby dataset and generate quality reports

## Task Id

QC-001

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Run MRIQC on Haxby dataset and generate quality reports

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Automatically assess scan quality with dozens of metrics covering artifacts, noise, and motion

## Expected Capability

mriqc_tool; qc_reporting

## Acceptance Metrics

reports_generated; quality_scores_computed

## Evidence Required

group_bold.html; sub-*_bold.html

