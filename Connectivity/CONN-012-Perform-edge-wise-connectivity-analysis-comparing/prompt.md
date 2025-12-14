# CONN-012: Perform edge-wise connectivity analysis comparing autism vs control in ABIDE

## Task Id

CONN-012

## Task Catefory

Connectivity

## Mode

Full-Stack

## User Prompt

Perform edge-wise connectivity analysis comparing autism vs control in ABIDE

## Input Data Ref

ABIDE

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Test every possible connection between regions (thousands of edges) to find specific links altered in autism

## Expected Capability

connectivity_tool; statistical_inference_tool; multiple_comparison_tool

## Acceptance Metrics

edge_pvalues_computed; fdr_corrected_edges

## Evidence Required

significant_edges.csv; edge_statistics.npy

