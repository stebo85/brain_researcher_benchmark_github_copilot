# SIM-006: Generate synthetic MEG data with known source locations

## Task Id

SIM-006

## Task Catefory

Simulation

## Mode

Full-Stack

## User Prompt

Generate synthetic MEG data with known source locations

## Input Data Ref

Cortical surface mesh

## Context Block

Create sensor-level MEG signals from specified brain sources

## Expected Capability

brain_simulation_tool; mne_source_tool

## Acceptance Metrics

meg_simulated; dipole_sources=5

## Evidence Required

synthetic_meg.fif; source_positions.csv

