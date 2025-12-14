# RT-002: Implement incremental GLM for online activation detection

## Task Id

RT-002

## Task Catefory

Real-time Processing

## Mode

Full-Stack

## User Prompt

Implement incremental GLM for online activation detection

## Input Data Ref

Streaming Localizer data

## Context Block

Update statistical model as each brain volume arrives during scan

## Expected Capability

realtime_fmri_tool; nilearn_glm_tool

## Acceptance Metrics

online_activation_detected; latency<2s

## Evidence Required

online_zstats.csv; detection_timestamps.json

