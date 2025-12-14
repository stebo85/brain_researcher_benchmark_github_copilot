# DL-010: Train Siamese network for brain fingerprinting and identification

## Task Id

DL-010

## Task Catefory

Deep Learning

## Mode

Full-Stack

## User Prompt

Train Siamese network for brain fingerprinting and identification

## Input Data Ref

HCP MegaTrawls

## Data Key

nilearn.datasets.fetch_megatrawls_netmats

## Context Block

Learn embedding space where same individual's scans are close and different individuals are far

## Expected Capability

siamese_network_tool; metric_learning

## Acceptance Metrics

identification_accuracy>0.9; embedding_separable

## Evidence Required

trained_siamese.pth; embedding_space.npy

