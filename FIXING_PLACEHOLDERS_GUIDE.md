# Guide to Fixing Placeholder Implementations

This guide provides instructions for fixing the 359 run_analysis.sh files that currently contain placeholder or dummy evidence implementations.

## Overview

**Goal:** Replace placeholder/dummy code with real analysis implementations that:
1. Load appropriate datasets as specified in `prompt.md`
2. Perform the actual analysis requested in the task description
3. Generate legitimate evidence files from real analysis results
4. Meet the acceptance criteria specified in `prompt.md`

## Identifying Placeholder Code

### Red Flags - Code That Needs to be Removed

1. **Explicit placeholder messages:**
   ```python
   print("Note: Analysis implementation placeholder")
   ```

2. **Dummy/random data generation:**
   ```python
   dummy_data = np.random.randn(64, 64, 64)
   dummy_img = nib.Nifti1Image(dummy_data, np.eye(4))
   ```

3. **Fake CSV data:**
   ```python
   sample_data = pd.DataFrame({
       'metric': ['accuracy', 'precision', 'recall'],
       'value': [0.85, 0.82, 0.88]
   })
   ```

4. **Sample evidence file text:**
   ```python
   with open(evidence_dir / 'output.html', 'w') as f:
       f.write('Sample evidence file for TASK-XXX\n')
   ```

5. **Placeholder visualizations:**
   ```python
   ax.text(0.5, 0.5, "Visualization Placeholder")
   ```

6. **Exception handlers that generate dummy data:**
   ```python
   except Exception as e:
       # Generate dummy data instead
       dummy_data = np.random.randn(...)
   ```

## Pattern: Real Implementation vs Placeholder

### ❌ PLACEHOLDER Example (SPEC-001)
```python
# Loads no dataset
print("Note: Analysis implementation placeholder")

# Generates random data
dummy_data = np.random.randn(64, 64, 64)
dummy_img = nib.Nifti1Image(dummy_data, np.eye(4))
nib.save(dummy_img, evidence_dir / 'denoised_bold.nii.gz')

# Creates fake metrics
sample_data = pd.DataFrame({
    'metric': ['accuracy', 'precision', 'recall'],
    'value': [0.85, 0.82, 0.88]
})
sample_data.to_csv(evidence_dir / 'component_table.csv', index=False)
```

### ✅ REAL Example (STAT-001)
```python
# Loads actual dataset
data = datasets.fetch_haxby()
fmri_filename = data.func[0]
labels_df = pd.read_csv(data.session_target[0], sep=' ')

# Performs real analysis
design_matrix = make_first_level_design_matrix(
    frame_times=frame_times,
    events=events_df,
    hrf_model='glover',
    drift_model='cosine'
)

fmri_glm = FirstLevelModel(t_r=tr, mask_img=mask_filename)
fmri_glm.fit(fmri_filename, events=events_df)

# Generates real results from analysis
beta_face = fmri_glm.compute_contrast('face', output_type='effect_size')
beta_face.to_filename(evidence_dir / "beta_maps.nii.gz")

contrast_faces_vs_houses = fmri_glm.compute_contrast('face - house', output_type='z_score')
contrast_faces_vs_houses.to_filename(evidence_dir / "contrast_zmap.nii.gz")
```

## Steps to Fix a Placeholder File

### 1. Review the Task Requirements
- Open the `prompt.md` file in the same directory
- Note the following fields:
  - **User Prompt:** What analysis to perform
  - **Input Data Ref:** Which dataset to use
  - **Data Key:** How to access the dataset (e.g., `nilearn.datasets.fetch_haxby`)
  - **Context Block:** Additional details about the analysis
  - **Evidence Required:** What files need to be generated
  - **Acceptance Metrics:** What the analysis should accomplish

### 2. Remove All Placeholder Code
- Delete `print("Note: Analysis implementation placeholder")`
- Remove all `dummy_data = np.random...` code
- Remove fake DataFrame generation with arbitrary values
- Remove sample evidence file text
- Remove exception handlers that fall back to dummy data

### 3. Implement Real Data Loading
Based on the "Data Key" in `prompt.md`:

```python
# Example for Haxby dataset
from nilearn import datasets
data = datasets.fetch_haxby()
fmri_filename = data.func[0]

# Example for ADHD dataset
data = datasets.fetch_adhd(n_subjects=10)

# Example for custom data (may need to be simulated)
# Check Data_Management category for examples
```

### 4. Implement Real Analysis
Follow the task description and use appropriate tools:

**For GLM/Statistical Analysis:**
```python
from nilearn.glm.first_level import FirstLevelModel
model = FirstLevelModel(...)
model.fit(data, events=events)
results = model.compute_contrast(...)
```

**For Classification/ML:**
```python
from sklearn.svm import SVC
from nilearn.decoding import Decoder
decoder = Decoder(estimator='svc', ...)
decoder.fit(X_train, y_train)
predictions = decoder.predict(X_test)
```

**For Connectivity:**
```python
from nilearn.connectome import ConnectivityMeasure
connectivity = ConnectivityMeasure(kind='correlation')
conn_matrix = connectivity.fit_transform([time_series])[0]
```

**For Preprocessing:**
```python
from nilearn.image import smooth_img, clean_img
smoothed = smooth_img(img, fwhm=6)
cleaned = clean_img(img, detrend=True, standardize=True)
```

### 5. Generate Real Evidence Files
- Save actual analysis outputs (not random data)
- Use appropriate formats (.nii.gz, .csv, .png, .npy, etc.)
- Ensure files match the "Evidence Required" list in `prompt.md`

```python
# Save nifti images from real analysis results
result_img.to_filename(evidence_dir / "output.nii.gz")

# Save real computed metrics
results_df = pd.DataFrame({
    'metric': actual_metric_names,
    'value': actual_computed_values
})
results_df.to_csv(evidence_dir / "results.csv", index=False)

# Save real visualizations
fig = plot_stat_map(real_stat_map, ...)
fig.savefig(evidence_dir / "visualization.png", dpi=300)
```

### 6. Test the Implementation
- Run the script: `bash run_analysis.sh`
- Verify evidence files are created
- Check that evidence files contain real data (not random/dummy)
- Ensure outputs meet acceptance criteria

## Reference: Categories by Status

### ✅ Already Complete (No changes needed)
- **Data_Management** (20/20 files)

### ⚠️ Partially Complete (Need selective fixes)
- **Machine_Learning** (4/20 need fixing)
- **Connectivity** (5/20 need fixing)  
- **Statistical_Inference** (9/20 need fixing)
- **Clinical_Analysis** (10/20 need fixing)
- **Statistical_Analysis** (14/20 need fixing)
- **Visualization** (17/20 need fixing)

### ❌ Completely Placeholder (All 20 files need fixing)
- Data_Harmonization
- Deep_Learning
- Diffusion
- Electrophysiology
- Knowledge_Graph
- Meta-Analysis
- Preprocessing
- Quality_Control
- Real-time_Processing
- Registration
- Segmentation
- Simulation
- Specialized_Processing
- Surface
- Workflow

## Tips and Best Practices

### Use Real Datasets
- Prefer public datasets from nilearn: `datasets.fetch_*`
- For tasks requiring specific data not available, document this limitation
- Consider using representative simulated data if necessary (but not random!)

### Follow Existing Patterns
- Look at "REAL" implementations in the same category
- Data_Management category has all real implementations
- Statistical_Analysis has good examples (STAT-001 through STAT-006)

### Handle Errors Gracefully
- Don't fall back to dummy data on errors
- Instead, fail with informative error messages
- Or skip optional outputs if they truly can't be generated

### Document Limitations
- If a task requires tools/data not available, document this
- Comment about what would be needed for full implementation
- Don't generate fake data to hide limitations

## Common Datasets in nilearn

```python
# Functional datasets
datasets.fetch_haxby()           # Object recognition fMRI
datasets.fetch_adhd()            # ADHD resting-state fMRI
datasets.fetch_development_fmri() # Developmental data

# Structural datasets
datasets.fetch_oasis_vbm()       # VBM analysis data

# Atlases
datasets.fetch_atlas_msdl()      # MSDL atlas
datasets.fetch_atlas_harvard_oxford()  # Harvard-Oxford atlas
datasets.fetch_coords_dosenbach_2010() # ROI coordinates

# Surface datasets
datasets.fetch_surf_nki_enhanced() # Surface timeseries
```

## Quality Checklist

Before considering a file "fixed", verify:

- [ ] No placeholder messages remain
- [ ] No dummy/random data generation
- [ ] Real dataset is loaded (when available)
- [ ] Actual analysis is performed
- [ ] Evidence files contain real results
- [ ] Evidence files match `prompt.md` requirements
- [ ] Acceptance metrics from `prompt.md` are met
- [ ] Script runs without errors
- [ ] Generated files can be validated

## Getting Help

For specific implementation questions:
1. Check `PLACEHOLDER_ANALYSIS_DETAILED.csv` for file status
2. Review `PLACEHOLDER_ANALYSIS_REPORT.md` for patterns
3. Look at similar "REAL" implementations in the same category
4. Refer to nilearn documentation: https://nilearn.github.io/
5. Check the task's `prompt.md` for specific requirements

---

*Last updated: 2025-12-15*
