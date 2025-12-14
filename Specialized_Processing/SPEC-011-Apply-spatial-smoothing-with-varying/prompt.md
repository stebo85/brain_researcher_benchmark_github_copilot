# SPEC-011: Apply spatial smoothing with varying kernel sizes and compare

## Task Id

SPEC-011

## Task Catefory

Specialized Processing

## Mode

Full-Stack

## User Prompt

Apply spatial smoothing with varying kernel sizes and compare

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Test FWHM from 4-10mm to find optimal smoothing

## Expected Capability

specialized_processing_tool; mvpa_tool

## Acceptance Metrics

smoothing_effects_quantified; optimal_fwhm_identified

## Evidence Required

smoothness_comparison.csv; smoothed_data/

