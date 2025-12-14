# DIFF-010: Perform TBSS voxel-wise statistics on FA maps across subjects

## Task Id

DIFF-010

## Task Catefory

Diffusion

## Mode

Full-Stack

## User Prompt

Perform TBSS voxel-wise statistics on FA maps across subjects

## Input Data Ref

Custom FA maps multi-subject

## Context Block

Align all subjects' white matter skeletons and test for group differences along major tracts

## Expected Capability

fsl_tbss_tool; voxelwise_stats

## Acceptance Metrics

skeleton_generated; tfce_corrected_pvals

## Evidence Required

tbss_FA_skeleton.nii.gz; tbss_stats.csv

