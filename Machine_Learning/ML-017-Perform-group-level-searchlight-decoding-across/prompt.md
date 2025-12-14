# ML-017: Perform group-level searchlight decoding across multiple subjects

## Task Id

ML-017

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Perform group-level searchlight decoding across multiple subjects

## Input Data Ref

Haxby multi-subject

## Context Block

Run searchlight at each voxel across subjects and test for above-chance decoding at group level

## Expected Capability

searchlight_tool; group_analysis

## Acceptance Metrics

group_searchlight_map; cluster_corrected_p<0.05

## Evidence Required

group_searchlight.nii.gz; significant_clusters.csv

