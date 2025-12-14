# DATA-003 Evidence: Convert Miyawaki Data to NIfTI

This directory contains evidence for the successful completion of task DATA-003.

## Task Description
Convert Miyawaki raw data to NIfTI format with proper metadata and sidecar files.

## Evidence Files

1. **converted_bold.nii.gz** - Converted BOLD image in NIfTI format (required)
   - Standard neuroimaging format
   - Includes proper header information
   - Compressed for efficiency

2. **sidecar.json** - BIDS-style metadata sidecar (required)
   - Contains acquisition parameters
   - Includes TR, TE, flip angle
   - Documents conversion process

3. **validation_summary.json** - Summary of conversion results
   - Overall status and metrics
   - File validation checks
   - Acceptance metrics pass/fail status

## Acceptance Metrics

- **nifti_created**: NIfTI file successfully created and valid
- **metadata_valid**: Sidecar JSON contains required metadata fields

## Dataset Information

- **Dataset**: Miyawaki 2008
- **Source**: Nilearn datasets / OpenNeuro ds006661
- **Modality**: fMRI
- **Task**: Visual object recognition
- **Reference**: Miyawaki et al., 2008, Neuron

## Validation Timestamp

See validation_summary.json for exact timestamp.
