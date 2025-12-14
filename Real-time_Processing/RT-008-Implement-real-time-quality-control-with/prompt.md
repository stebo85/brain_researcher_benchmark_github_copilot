# RT-008: Implement real-time quality control with automatic scan abort

## Task Id

RT-008

## Task Catefory

Real-time Processing

## Mode

Full-Stack

## User Prompt

Implement real-time quality control with automatic scan abort

## Input Data Ref

Streaming fMRI with motion

## Context Block

Detect severe motion or artifacts and trigger scan termination to save time

## Expected Capability

realtime_fmri_tool; qc_tools

## Acceptance Metrics

abort_threshold_defined; automatic_termination

## Evidence Required

qc_timeseries.csv; abort_decisions.json

