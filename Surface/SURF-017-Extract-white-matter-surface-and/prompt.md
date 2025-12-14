# SURF-017: Extract white matter surface and compute WM-GM contrast

## Task Id

SURF-017

## Task Catefory

Surface

## Mode

Full-Stack

## User Prompt

Extract white matter surface and compute WM-GM contrast

## Input Data Ref

FreeSurfer surfaces

## Context Block

Calculate contrast between white and gray matter intensities at cortical boundary

## Expected Capability

freesurfer_tool; wm_gm_contrast

## Acceptance Metrics

wm_surface_generated; contrast_map_computed

## Evidence Required

lh.white; wm_gm_contrast.gii

