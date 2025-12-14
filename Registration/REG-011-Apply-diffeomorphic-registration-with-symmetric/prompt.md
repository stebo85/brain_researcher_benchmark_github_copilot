# REG-011: Apply diffeomorphic registration with symmetric normalization for OASIS

## Task Id

REG-011

## Task Catefory

Registration

## Mode

Full-Stack

## User Prompt

Apply diffeomorphic registration with symmetric normalization for OASIS

## Input Data Ref

OASIS VBM dataset

## Data Key

nilearn.datasets.fetch_oasis_vbm

## Context Block

Use topology-preserving warps that maintain one-to-one correspondence between brains

## Expected Capability

ants_syn_tool; diffeomorphic_registration

## Acceptance Metrics

diffeomorphism_achieved; jacobian_positive

## Evidence Required

syn_warp.nii.gz; jacobian_map.nii.gz

