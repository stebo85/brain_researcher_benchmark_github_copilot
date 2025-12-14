# SURF-005: Perform surface-based smoothing with 10mm FWHM on cortical data

## Task Id

SURF-005

## Task Catefory

Surface

## Mode

Full-Stack

## User Prompt

Perform surface-based smoothing with 10mm FWHM on cortical data

## Input Data Ref

Surface fMRI data

## Context Block

Smooth data along the cortical surface (not through cortex) to increase signal-to-noise

## Expected Capability

surface_smoothing_tool; nilearn_surface

## Acceptance Metrics

smoothed_10mm_fwhm; surface_topology_preserved

## Evidence Required

lh_smooth.gii; rh_smooth.gii

