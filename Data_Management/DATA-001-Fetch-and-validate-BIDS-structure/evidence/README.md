# DATA-001 Evidence: Fetch and Validate BIDS Structure

This directory contains evidence for the successful completion of task DATA-001.

## Task Description
Fetch and validate BIDS structure for Haxby dataset from OpenNeuro (ds000105).

## Evidence Files

1. **dataset_description.json** - BIDS dataset descriptor (required)
   - Contains dataset name, BIDS version, and metadata
   - Validates that the dataset follows BIDS specification

2. **participants.tsv** - Participant information (required)
   - Lists all subjects in the dataset
   - Contains participant IDs and metadata

3. **participants.json** - Participant metadata schema (optional)
   - Describes the columns in participants.tsv

4. **bids_validation_report.txt** - BIDS validator output
   - Detailed validation results from bids-validator
   - Lists any warnings or errors found

5. **validation_summary.json** - Summary of validation results
   - Overall validation status
   - Counts of subjects, files, and checks performed
   - Acceptance metrics pass/fail status

## Acceptance Metrics

- ✓ **bids_valid**: Dataset passes BIDS validation
- ✓ **all_subjects_present**: All subjects listed in participants.tsv have corresponding directories

## Dataset Information

- **Dataset**: Haxby 2001 (Visual Object Recognition)
- **OpenNeuro ID**: ds000105
- **Modality**: fMRI
- **URL**: https://openneuro.org/datasets/ds000105

## Validation Timestamp

See validation_summary.json for exact timestamp.
