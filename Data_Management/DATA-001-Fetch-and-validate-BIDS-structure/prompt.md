# DATA-001: Fetch and validate BIDS structure for Haxby dataset

## Task Id

DATA-001

## Task Catefory

Data Management

## Mode

Full-Stack

## User Prompt

Fetch and validate BIDS structure for Haxby dataset

## Input Data Ref

Haxby dataset

## Data Key

openneuro ds000105 or nilearn.datasets.fetch_haxby

## Context Block

Download the dataset and check that all files are organized according to BIDS standards with proper naming

## Expected Capability

bids_tools; data_management_tool

## Acceptance Metrics

bids_valid; all_subjects_present

## Evidence Required

dataset_description.json; participants.tsv

