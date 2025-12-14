# DATA-011: Build searchable metadata index for NeuroVault collection

## Task Id

DATA-011

## Task Catefory

Data Management

## Mode

Full-Stack

## User Prompt

Build searchable metadata index for NeuroVault collection

## Input Data Ref

NeuroVault statistical maps

## Data Key

from nilearn.datasets import fetch_neurovault_ids

## Context Block

Create a database of all brain maps with tags for task, contrast type, and statistical method

## Expected Capability

metadata_indexer; search_tool

## Acceptance Metrics

index_created; search_functional

## Evidence Required

metadata_index.db; search_interface.html

