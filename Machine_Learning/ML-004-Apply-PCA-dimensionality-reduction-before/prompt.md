# ML-004: Apply PCA dimensionality reduction before decoding in Haxby dataset

## Task Id

ML-004

## Task Catefory

Machine Learning

## Mode

Full-Stack

## User Prompt

Apply PCA dimensionality reduction before decoding in Haxby dataset

## Input Data Ref

Haxby dataset

## Data Key

nilearn.datasets.fetch_haxby

## Context Block

Reduce thousands of voxels to principal components to improve decoding and avoid overfitting

## Expected Capability

pca_tool; feature_selection_tool; mvpa_tool

## Acceptance Metrics

variance_explained>80%; accuracy_maintained

## Evidence Required

pca_components.npy; component_maps.nii.gz

