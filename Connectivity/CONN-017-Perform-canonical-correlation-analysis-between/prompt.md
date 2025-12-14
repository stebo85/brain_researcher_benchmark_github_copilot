# CONN-017: Perform canonical correlation analysis between connectivity and behavior in HCP

## Task Id

CONN-017

## Task Catefory

Connectivity

## Mode

Full-Stack

## User Prompt

Perform canonical correlation analysis between connectivity and behavior in HCP

## Input Data Ref

HCP MegaTrawls

## Data Key

nilearn.datasets.fetch_megatrawls_netmats

## Context Block

Find the brain connectivity patterns that best predict combinations of behavioral measures

## Expected Capability

connectivity_tool; cca_analysis; behavioral_correlation

## Acceptance Metrics

cca_components; brain_behavior_r>0.3

## Evidence Required

cca_loadings.csv; prediction_scatter.png

