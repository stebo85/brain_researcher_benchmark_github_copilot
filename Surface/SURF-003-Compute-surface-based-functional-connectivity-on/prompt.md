# SURF-003: Compute surface-based functional connectivity on NKI Enhanced dataset

## Task Id

SURF-003

## Task Catefory

Surface

## Mode

Full-Stack

## User Prompt

Compute surface-based functional connectivity on NKI Enhanced dataset

## Input Data Ref

NKI Enhanced surface

## Data Key

nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki

## Context Block

Calculate correlations between vertices on the cortical surface to find functional networks

## Expected Capability

connectivity_tool; surface_analysis

## Acceptance Metrics

vertex_connectivity_10242x10242; network_maps_generated

## Evidence Required

lh_connectivity.gii; rh_connectivity.gii

