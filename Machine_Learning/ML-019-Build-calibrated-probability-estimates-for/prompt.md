# ML-019: Build calibrated probability estimates for clinical decision support

## Task Id

ML-019

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Build calibrated probability estimates for clinical decision support

## Input Data Ref

ADHD-200

## Data Key

nilearn.datasets.fetch_adhd

## Context Block

Transform classifier scores into well-calibrated probabilities using Platt scaling or isotonic regression

## Expected Capability

probability_calibration_tool; clinical_tool

## Acceptance Metrics

calibration_curve_diagonal; brier_score_low

## Evidence Required

calibrated_probabilities.csv; calibration_plot.png

