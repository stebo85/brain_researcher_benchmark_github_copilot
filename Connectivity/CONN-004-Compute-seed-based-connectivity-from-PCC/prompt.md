# CONN-004: Compute seed-based connectivity from PCC to whole brain on development data

## Task Id

CONN-004

## Task Catefory

Connectivity

## Mode

Full-Stack

## User Prompt

Compute seed-based connectivity from PCC to whole brain on development data

## Input Data Ref

Development fMRI

## Context Block

Pick the posterior cingulate (default mode hub) and find everywhere in the brain that synchronizes with it

## Expected Capability

connectivity_tool; nilearn_seed_correlation

## Acceptance Metrics

seed_map_generated; spatial_extent_measured

## Evidence Required

pcc_connectivity_map.nii.gz; peak_coordinates.csv

