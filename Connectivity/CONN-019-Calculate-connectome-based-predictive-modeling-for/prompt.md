# CONN-019: Calculate connectome-based predictive modeling for ADHD diagnosis

## Task Id

CONN-019

## Task Catefory

Connectivity

## Mode

Full-Stack

## User Prompt

Calculate connectome-based predictive modeling for ADHD diagnosis

## Input Data Ref

ADHD-200

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Use whole-brain connectivity patterns to build a predictive model that classifies ADHD vs control

## Expected Capability

connectivity_tool; mvpa_tool; cross_validation_tool

## Acceptance Metrics

cpm_accuracy>0.7; positive_negative_networks

## Evidence Required

cpm_edges.csv; prediction_accuracy.txt

