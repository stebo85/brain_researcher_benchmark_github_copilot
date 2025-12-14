# SURF-002: Extract cortical thickness from Desikan-Killiany parcellation

## Task Id

SURF-002

## Task Catefory

Surface

## Mode

Full-Stack

## User Prompt

Extract cortical thickness from Desikan-Killiany parcellation

## Input Data Ref

FreeSurfer output

## Context Block

Measure thickness of cortex in 68 regions defined by anatomical landmarks

## Expected Capability

freesurfer_stats_tool; parcellation_tool

## Acceptance Metrics

thickness_68_regions; mean_thickness_computed

## Evidence Required

lh.aparc.stats; rh.aparc.stats; thickness.csv

