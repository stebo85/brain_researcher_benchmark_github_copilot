# CLIN-008: Identify individual ADHD subtype from brain connectivity fingerprint

## Task Id

CLIN-008

## Task Catefory

Clinical Analysis

## Mode

Full-Stack

## User Prompt

Identify individual ADHD subtype from brain connectivity fingerprint

## Input Data Ref

ADHD-200 dataset

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Classify inattentive vs hyperactive vs combined ADHD subtypes from neural data

## Expected Capability

connectivity_tool; mvpa_tool

## Acceptance Metrics

3class_accuracy>0.6; subtype_signatures

## Evidence Required

subtype_classifier.pkl; connectivity_signatures.npy

