# QC-013: Run FreeSurfer Euler number QC on ABIDE structural reconstructions

## Task Id

QC-013

## Task Catefory

Quality Control

## Mode

Full-Stack

## User Prompt

Run FreeSurfer Euler number QC on ABIDE structural reconstructions

## Input Data Ref

ABIDE dataset

## Data Key

nilearn.datasets.fetch_abide_pcp

## Context Block

Check surface reconstruction quality using topological defect count

## Expected Capability

freesurfer_qc_tool; surface_checker

## Acceptance Metrics

euler_numbers_computed; threshold<-200

## Evidence Required

euler_summary.csv; failed_recons.txt

