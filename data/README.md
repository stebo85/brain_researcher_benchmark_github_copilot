# Data Directory

This directory is for storing brain imaging data files used in analyses.

## Purpose

Store neuroimaging data files that will be processed by your analyses:
- NIfTI files (`.nii`, `.nii.gz`)
- DICOM files
- FreeSurfer outputs
- FSL results
- Other neuroimaging formats

## Usage

### Adding Data

1. **Small files** (< 100 MB): Can be committed directly to the repository
   ```bash
   cp /path/to/scan.nii.gz data/
   git add data/scan.nii.gz
   git commit -m "Add brain scan data"
   ```

2. **Large files**: Use Git LFS (Large File Storage)
   ```bash
   git lfs track "*.nii.gz"
   git add .gitattributes
   git add data/large_scan.nii.gz
   git commit -m "Add large scan with Git LFS"
   ```

3. **External data**: Reference external datasets via URLs or download in analysis
   ```bash
   # In your analysis markdown
   wget https://example.com/data/scan.nii.gz -O data/scan.nii.gz
   ```

### Referencing Data in Analyses

Reference files using relative or absolute paths:

```bash
# Relative path (from repository root)
input_file="data/T1_brain.nii.gz"

# Absolute path (from GitHub Actions runner)
input_file="$GITHUB_WORKSPACE/data/T1_brain.nii.gz"
```

## Data Organization

Organize data by project or analysis:

```
data/
├── README.md
├── project1/
│   ├── subject001/
│   │   ├── T1.nii.gz
│   │   └── T2.nii.gz
│   └── subject002/
│       ├── T1.nii.gz
│       └── T2.nii.gz
└── project2/
    └── group_analysis/
        └── template.nii.gz
```

## Best Practices

### 1. Use Standard Formats

Prefer standard neuroimaging formats:
- **NIfTI** (`.nii` or `.nii.gz`) - Most common
- **DICOM** - Medical imaging standard
- **MGH/MGZ** - FreeSurfer format
- **GIFTI/CIFTI** - Surface-based data

### 2. Follow BIDS

Consider using [BIDS (Brain Imaging Data Structure)](https://bids.neuroimaging.io/):

```
data/
└── bids_dataset/
    ├── dataset_description.json
    ├── participants.tsv
    └── sub-01/
        └── anat/
            └── sub-01_T1w.nii.gz
```

### 3. Anonymize Data

**Important**: Remove all personally identifiable information (PII):
- Patient names
- Dates of birth
- Medical record numbers
- Face information (use defacing tools)

Tools for anonymization:
```bash
# PyDeface for removing faces from MRI
pydeface input.nii.gz output.nii.gz

# FSL's fsldeface
fsldeface input.nii.gz output.nii.gz
```

### 4. Document Data

Create a `data_description.md` file:

```markdown
# Data Description

## Dataset: Example Study
- **Source**: XYZ University
- **N**: 20 subjects
- **Acquisition**: 3T Siemens scanner
- **Sequences**: T1-weighted MPRAGE

## Files
- `T1_*.nii.gz`: T1-weighted anatomical scans
- `fMRI_*.nii.gz`: Functional MRI scans
```

## Privacy and Security

### Protected Health Information (PHI)

**Never commit PHI to the repository!**

If working with protected data:
1. Use a **private repository**
2. Enable **branch protection**
3. Limit **collaborator access**
4. Follow **HIPAA/GDPR** requirements
5. Use **institutional data storage** when possible

### Sharing Data

Before sharing:
- [ ] Data is anonymized
- [ ] No PHI is included
- [ ] Ethics approval obtained
- [ ] Data use agreement signed
- [ ] Institutional review completed

## Git LFS Configuration

For large files, set up Git LFS:

```bash
# Install Git LFS
git lfs install

# Track large file types
git lfs track "*.nii.gz"
git lfs track "*.nii"
git lfs track "*.mgz"
git lfs track "*.mgh"

# Commit the tracking configuration
git add .gitattributes
git commit -m "Configure Git LFS for neuroimaging files"
```

## Temporary Data

For temporary data (not to be committed):

1. Add to `.gitignore`:
   ```
   data/temp/
   data/*.tmp
   ```

2. Or store in GitHub Actions runner temp space:
   ```bash
   # In your analysis
   TEMP_DIR="/tmp/analysis_temp"
   mkdir -p "$TEMP_DIR"
   # ... use for temporary files ...
   rm -rf "$TEMP_DIR"  # Cleanup
   ```

## Example Analysis Using Data

```markdown
# T1 Brain Extraction Analysis

## Data
Input: `data/subject01/T1.nii.gz`

## Analysis

```bash
# Set input and output paths
input="data/subject01/T1.nii.gz"
output="results/subject01_brain.nii.gz"

# Check if input exists
if [ ! -f "$input" ]; then
    echo "Error: Input file not found"
    exit 1
fi

# Run brain extraction (example - would use container)
echo "Extracting brain from $input"
# bet $input $output -f 0.5
```
```

## External Data Sources

Consider using public datasets:

- **OpenNeuro**: https://openneuro.org/
- **Human Connectome Project**: https://www.humanconnectome.org/
- **NITRC**: https://www.nitrc.org/
- **ADNI**: https://adni.loni.usc.edu/

Example downloading from OpenNeuro:
```bash
# Install OpenNeuro CLI
pip install openneuro-cli

# Download a dataset
openneuro download ds000001 data/ds000001/
```

## Storage Limits

Be mindful of repository size:
- GitHub repositories: Recommended < 1 GB
- Git LFS: Check your plan limits
- Consider external storage for large datasets

## Support

For questions about data handling:
- See [CONTRIBUTING.md](../CONTRIBUTING.md)
- Check [SECURITY.md](../SECURITY.md) for privacy guidelines
- Review BIDS specification for data organization
- Consult your institution's data management policies
