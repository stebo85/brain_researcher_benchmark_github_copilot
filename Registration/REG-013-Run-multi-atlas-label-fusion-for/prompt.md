# REG-013: Run multi-atlas label fusion for improved ADHD-200 segmentation

## Task Id

REG-013

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Run multi-atlas label fusion for improved ADHD-200 segmentation

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Register multiple atlas brains and combine their labels for robust tissue classification

## Expected Capability

ants_joint_fusion; multi_atlas

## Acceptance Metrics

fusion_complete; consensus_labels

## Evidence Required

fused_segmentation.nii.gz; posterior_probs.nii.gz

