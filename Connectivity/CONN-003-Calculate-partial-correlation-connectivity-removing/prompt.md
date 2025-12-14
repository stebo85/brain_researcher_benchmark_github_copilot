# CONN-003: Calculate partial correlation connectivity removing global signal on ABIDE

## Task Id

CONN-003

## Task Catefory

Connectivity

## Mode

Full-Stack

## User Prompt

Calculate partial correlation connectivity removing global signal on ABIDE

## Input Data Ref

ABIDE

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Measure direct connections between regions while removing shared influences to find autism-specific connectivity patterns

## Expected Capability

conn_tool; statistical_inference_tool

## Acceptance Metrics

partial_corr_computed; autism_differences_p<0.05

## Evidence Required

partial_correlation.npy; significant_edges.csv

