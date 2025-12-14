# RT-009: Perform online normalization to standard space

## Task Id

RT-009

## Task Catefory

Real-time Processing

## Mode

Full-Stack

## User Prompt

Perform online normalization to standard space

## Input Data Ref

Streaming EPI volumes

## Context Block

Warp each brain volume to template space as it's acquired

## Expected Capability

realtime_fmri_tool; registration_tool

## Acceptance Metrics

online_normalization; latency<2s

## Evidence Required

normalized_volumes.nii.gz; transform_log.json

