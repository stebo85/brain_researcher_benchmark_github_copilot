# ML-013: Train elastic net regression combining L1 and L2 penalties for connectivity

## Task Id

ML-013

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Train elastic net regression combining L1 and L2 penalties for connectivity

## Input Data Ref

HCP MegaTrawls

## Data Key

nilearn.datasets.fetch_megatrawls_netmats

## Context Block

Use regularization that both selects features and prevents overfitting for age prediction

## Expected Capability

elastic_net_tool; regularization_tool

## Acceptance Metrics

sparse_solution; prediction_mae<5_years

## Evidence Required

trained_enet.pkl; nonzero_weights.csv

