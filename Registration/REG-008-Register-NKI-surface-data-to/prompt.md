# REG-008: Register NKI surface data to multiple target spaces (fsaverage5, fsaverage6)

## Task Id

REG-008

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Register NKI surface data to multiple target spaces (fsaverage5, fsaverage6)

## Input Data Ref

NKI Enhanced dataset

## Data Key

nilearn.datasets.fetch_surf_nki_enhanced and nilearn.datasets.load_nki

## Context Block

Transform surface data to different resolution templates for multi-scale analysis

## Expected Capability

mris_register_tool; multiresolution

## Acceptance Metrics

multiple_spaces_registered; vertex_correspondence

## Evidence Required

fsavg5_lh.func.gii; fsavg6_lh.func.gii

