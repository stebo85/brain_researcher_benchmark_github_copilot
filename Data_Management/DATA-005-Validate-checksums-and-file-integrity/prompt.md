# DATA-005: Validate checksums and file integrity for OASIS VBM dataset

## Task Id

DATA-005

## Task Catefory

Data Management

## Mode

Full-Stack

## User Prompt

Validate checksums and file integrity for OASIS VBM dataset

## Input Data Ref

OASIS VBM dataset

## Data Key

nilearn.datasets.fetch_oasis_vbm

## Context Block

Verify that downloaded files aren't corrupted by checking digital fingerprints match expected values

## Expected Capability

integrity_check_tool; data_validation

## Acceptance Metrics

checksums_valid; no_corruption

## Evidence Required

checksum_report.csv; validation_log.txt

