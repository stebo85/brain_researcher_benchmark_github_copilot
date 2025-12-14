# CONN-006: Extract HCP connectivity matrices at 200-parcel resolution for age prediction

## Task Id

CONN-006

## Task Catefory

Connectivity

## Mode

Full-Stack

## User Prompt

Extract HCP connectivity matrices at 200-parcel resolution for age prediction

## Input Data Ref

HCP MegaTrawls

## Data Key

nilearn.datasets.fetch_megatrawls_netmats

## Context Block

Get connectivity data from 461 subjects using 200 brain regions to train age prediction models

## Expected Capability

connectivity_tool; hcp_data_loader

## Acceptance Metrics

200x200_matrices_extracted; n_subjects=461

## Evidence Required

connectivity_matrices.h5; subject_metadata.csv

