# SEG-014: Segment cortical thickness maps from Haxby FreeSurfer outputs

## Task Id

SEG-014

## Task Catefory

Segmentation

## Mode

Full-Stack

## User Prompt

Segment cortical thickness maps from Haxby FreeSurfer outputs

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Compute distance between pial and white surfaces at each vertex for thickness measurement

## Expected Capability

thickness_tool; surface_analysis

## Acceptance Metrics

thickness_computed; range_1.5-4.5mm

## Evidence Required

lh.thickness; rh.thickness; thickness_stats.csv

