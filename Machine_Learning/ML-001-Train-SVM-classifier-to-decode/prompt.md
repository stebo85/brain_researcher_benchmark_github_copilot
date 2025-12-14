# ML-001: Train SVM classifier to decode object categories from Haxby VT cortex

## Task Id

ML-001

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Train SVM classifier to decode object categories from Haxby VT cortex

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Use support vector machine to learn patterns that distinguish faces, houses, cats, etc from brain activity

## Expected Capability

mvpa_tool; svm_classifier

## Acceptance Metrics

cv_accuracy>0.7; 8_category_classification

## Evidence Required

cv_scores.csv; confusion_matrix.png

