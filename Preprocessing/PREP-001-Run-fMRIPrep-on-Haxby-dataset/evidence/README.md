# PREP-001 Evidence: Run fMRIPrep on Haxby dataset with FreeSurfer surface reconstruction

## Task Description
Clean up raw fMRI data with motion correction, distortion correction, normalize to standard space, and reconstruct cortical surfaces

## Dataset
Haxby dataset

## Data Key
openneuro ds000105 or nilearn.datasets.fetch_haxby

## Evidence Files

1. **sub-*/func/*_space-MNI_bold.nii.gz**
2. **sub-*/anat/surf/**

## Analysis Summary

See `analysis_summary.json` for detailed results.

## Timestamp

Analysis run: $(date -Iseconds)
