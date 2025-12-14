# STAT-008: Run AFNI 3dClustSim Monte Carlo correction on SPM auditory

## Task Id

STAT-008

## Task Catefory

Statistical Analysis

## Mode

Full-Stack

## User Prompt

Run AFNI 3dClustSim Monte Carlo correction on SPM auditory

## Input Data Ref

SPM auditory dataset

## Data Key

nilearn.datasets.fetch_spm_auditory

## Context Block

Estimate cluster-size threshold via simulation preserving spatial autocorrelation structure

## Expected Capability

afni_clustsim_tool; monte_carlo

## Acceptance Metrics

cluster_threshold_estimated; alpha=0.05

## Evidence Required

cluster_threshold_table.txt; acf_parameters.txt

