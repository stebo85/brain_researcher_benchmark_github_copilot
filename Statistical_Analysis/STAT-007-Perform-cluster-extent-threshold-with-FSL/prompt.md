# STAT-007: Perform cluster-extent threshold with FSL randomise on ABIDE

## Task Id

STAT-007

## Task Catefory

Statistical Analysis

## Mode

Full-Stack

## User Prompt

Perform cluster-extent threshold with FSL randomise on ABIDE

## Input Data Ref

ABIDE dataset

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Use permutation testing with cluster-size inference for robust multiple comparison correction

## Expected Capability

fsl_randomise_tool; permutation_test

## Acceptance Metrics

randomise_complete; tfce_map_generated

## Evidence Required

randomise_tfce_tstat.nii.gz; cluster_table.txt

