# DIFF-011: Generate FOD spherical harmonic representations for fiber orientation

## Task Id

DIFF-011

## Task Catefory

Diffusion

## Mode

Full-Stack

## User Prompt

Generate FOD spherical harmonic representations for fiber orientation

## Input Data Ref

Custom DWI data

## Context Block

Represent fiber orientations at each voxel as spherical functions to capture crossing fibers

## Expected Capability

mrtrix3_fod_tool; spherical_deconv

## Acceptance Metrics

fod_computed; crossing_fibers_resolved

## Evidence Required

fod.mif; fod_peaks.nii.gz

