# CONN-013: Extract connectome fingerprints for individual identification from HCP data

## Task Id

CONN-013

## Task Catefory

Connectivity

## Mode

Full-Stack

## User Prompt

Extract connectome fingerprints for individual identification from HCP data

## Input Data Ref

HCP MegaTrawls

## Data Key

nilearn.datasets.fetch_megatrawls_netmats

## Context Block

Use unique connectivity patterns as a brain fingerprint to identify individuals across scanning sessions

## Expected Capability

connectivity_tool; multivariate_analysis

## Acceptance Metrics

identification_accuracy>0.9; differential_identifiability

## Evidence Required

fingerprint_vectors.npy; identification_matrix.csv

