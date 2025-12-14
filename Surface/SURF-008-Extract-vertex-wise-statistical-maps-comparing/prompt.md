# SURF-008: Extract vertex-wise statistical maps comparing cortical thickness across groups

## Task Id

SURF-008

## Task Catefory

Surface

## Mode

Full-Stack

## User Prompt

Extract vertex-wise statistical maps comparing cortical thickness across groups

## Input Data Ref

FreeSurfer multi-subject

## Context Block

Test every surface vertex for group differences in thickness while controlling for multiple comparisons

## Expected Capability

surface_statistics_tool; vertex_wise_analysis

## Acceptance Metrics

vertex_pvalues_computed; cluster_corrected

## Evidence Required

thickness_pvals.gii; significant_clusters.csv

