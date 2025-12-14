# DIFF-005: Compute structural connectome using AAL atlas parcellation

## Task Id

DIFF-005

## Task Catefory

Diffusion

## Mode

Full-Stack

## User Prompt

Compute structural connectome using AAL atlas parcellation

## Input Data Ref

Custom DWI + AAL atlas

## Context Block

Build connectivity matrix showing white matter connections between 167 brain regions

## Expected Capability

diffusion_tractography_tool; connectome_tool

## Acceptance Metrics

connectome_167x167; weighted_by_streamlines

## Evidence Required

structural_connectome.csv; connectome_plot.png

