# ML-011: Build multi-class SVM with one-vs-rest strategy for 8 Haxby categories

## Task Id

ML-011

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Build multi-class SVM with one-vs-rest strategy for 8 Haxby categories

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Train separate binary classifier for each category against all others

## Expected Capability

multiclass_svm_tool; ovr_strategy

## Acceptance Metrics

8_classifiers_trained; macro_avg_f1>0.65

## Evidence Required

ovr_classifiers.pkl; per_class_performance.csv

