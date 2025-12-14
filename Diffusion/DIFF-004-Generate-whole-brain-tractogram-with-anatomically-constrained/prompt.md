# DIFF-004: Generate whole-brain tractogram with anatomically-constrained tracking

## Task Id

DIFF-004

## Task Catefory

Diffusion

## Mode

Full-Stack

## User Prompt

Generate whole-brain tractogram with anatomically-constrained tracking

## Input Data Ref

Custom DWI + T1w

## Context Block

Create complete white matter pathway map while using anatomical boundaries to prevent invalid tracks

## Expected Capability

diffusion_tractography_tool; mrtrix3_tool

## Acceptance Metrics

tractogram_generated; anatomical_constraints_applied

## Evidence Required

whole_brain.tck; tck_stats.txt

