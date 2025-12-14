# STAT-012: Apply Bonferroni correction for family-wise error on ROI analysis

## Task Id

STAT-012

## Task Catefory

Statistical Analysis

## Mode

Full-Stack

## User Prompt

Apply Bonferroni correction for family-wise error on ROI analysis

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Use most conservative multiple comparison method dividing alpha by number of tests

## Expected Capability

bonferroni_tool; fwe_control

## Acceptance Metrics

bonferroni_applied; fwe<0.05

## Evidence Required

bonferroni_corrected.csv; significant_rois.txt

