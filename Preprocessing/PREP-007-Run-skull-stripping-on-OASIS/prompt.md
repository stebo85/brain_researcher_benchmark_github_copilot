# PREP-007: Run skull stripping on OASIS structural images

## Task Id

PREP-007

## Task Catefory

Preprocessing

## Mode

Full-Stack

## User Prompt

Run skull stripping on OASIS structural images

## Input Data Ref

OASIS VBM dataset

## Data Key

nilearn.datasets.fetch_oasis_vbm

## Context Block

Remove non-brain tissue like skull and scalp to focus analysis on brain only

## Expected Capability

skull_stripping_tool; bet_tool

## Acceptance Metrics

brain_extracted; no_skull_present

## Evidence Required

brain_mask.nii.gz; brain_extracted.nii.gz

