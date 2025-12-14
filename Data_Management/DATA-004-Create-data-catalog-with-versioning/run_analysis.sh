#!/bin/bash
set -e  # Exit on error
set -x  # Print commands as they execute

# DATA-004: Create data catalog with versioning for Brainomics Localizer
# This script creates a searchable catalog with version tracking

echo "=========================================="
echo "DATA-004: Create Data Catalog with Versioning"
echo "Dataset: Brainomics Localizer"
echo "=========================================="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ANALYSIS_DIR="${SCRIPT_DIR}"
EVIDENCE_DIR="${ANALYSIS_DIR}/evidence"
mkdir -p "${EVIDENCE_DIR}"

# Configure Git
echo "Step 0: Configuring Git..."
GIT_USER_NAME=$(git config --global user.name 2>/dev/null || echo "")
GIT_USER_EMAIL=$(git config --global user.email 2>/dev/null || echo "")

if [ -z "$GIT_USER_NAME" ]; then
    git config --global user.name "Analysis Runner"
fi

if [ -z "$GIT_USER_EMAIL" ]; then
    git config --global user.email "runner@analysis.local"
fi

# Setup Python environment
echo ""
echo "Step 1: Setting up Python virtual environment..."
VENV_DIR="${ANALYSIS_DIR}/.venv"
python3 -m venv "${VENV_DIR}"
. "${VENV_DIR}/bin/activate"
python -m pip install --upgrade pip

# Install required packages
echo ""
echo "Step 2: Installing required Python packages..."
python -m pip install nilearn pandas

# Create data catalog
echo ""
echo "Step 3: Creating data catalog with versioning..."
python3 << 'PYEOF'
import os
import json
import sqlite3
import hashlib
from datetime import datetime
from nilearn.datasets import fetch_localizer_contrasts
import pandas as pd

print("Fetching Brainomics Localizer dataset...")
localizer_data = fetch_localizer_contrasts(['checkerboard'], n_subjects=2)

print(f"Downloaded {len(localizer_data.cmaps)} contrast maps")

# Create SQLite database for catalog
conn = sqlite3.connect('data_catalog.db')
cursor = conn.cursor()

# Create tables
cursor.execute('''
    CREATE TABLE IF NOT EXISTS files (
        id INTEGER PRIMARY KEY,
        filename TEXT,
        file_path TEXT,
        file_type TEXT,
        size_bytes INTEGER,
        md5_hash TEXT,
        created_date TEXT,
        version INTEGER
    )
''')

cursor.execute('''
    CREATE TABLE IF NOT EXISTS versions (
        version_id INTEGER PRIMARY KEY,
        version_number INTEGER,
        timestamp TEXT,
        description TEXT
    )
''')

# Calculate MD5 hash for files
def calculate_md5(filepath):
    if not os.path.exists(filepath):
        return "N/A"
    hash_md5 = hashlib.md5()
    with open(filepath, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()

# Add version entry
version = 1
cursor.execute('''
    INSERT INTO versions (version_number, timestamp, description)
    VALUES (?, ?, ?)
''', (version, datetime.now().isoformat(), "Initial catalog creation"))

# Catalog files
for idx, cmap_file in enumerate(localizer_data.cmaps):
    if os.path.exists(cmap_file):
        file_size = os.path.getsize(cmap_file)
        md5_hash = calculate_md5(cmap_file)
        
        cursor.execute('''
            INSERT INTO files (filename, file_path, file_type, size_bytes, md5_hash, created_date, version)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', (os.path.basename(cmap_file), cmap_file, 'nifti', file_size, md5_hash, 
              datetime.now().isoformat(), version))

conn.commit()

# Query and display catalog
cursor.execute('SELECT COUNT(*) FROM files')
file_count = cursor.fetchone()[0]
print(f"\n✓ Cataloged {file_count} files")

cursor.execute('SELECT filename, size_bytes, version FROM files')
rows = cursor.fetchall()
for row in rows[:5]:
    print(f"  - {row[0]} ({row[1]} bytes, v{row[2]})")

conn.close()
print("✓ Created data_catalog.db")

# Create version log
with open('version_log.txt', 'w') as f:
    f.write("Data Catalog Version Log\n")
    f.write("=" * 50 + "\n\n")
    f.write(f"Version 1.0 - {datetime.now().isoformat()}\n")
    f.write("  - Initial catalog creation\n")
    f.write(f"  - Cataloged {file_count} files from Brainomics Localizer dataset\n")
    f.write("  - MD5 checksums computed for all files\n")
    f.write("\nFile Inventory:\n")
    for row in rows:
        f.write(f"  - {row[0]} (v{row[2]})\n")

print("✓ Created version_log.txt")
PYEOF

# Copy evidence files
echo ""
echo "Step 4: Copying evidence files..."
cp data_catalog.db "${EVIDENCE_DIR}/"
cp version_log.txt "${EVIDENCE_DIR}/"
echo "✓ Evidence files copied"

# Generate validation summary
echo ""
echo "Step 5: Generating validation summary..."
python3 << 'PYEOF' > "${EVIDENCE_DIR}/validation_summary.json"
import json
import os
import sqlite3
from datetime import datetime

catalog_exists = os.path.exists('data_catalog.db')
log_exists = os.path.exists('version_log.txt')

# Query catalog
if catalog_exists:
    conn = sqlite3.connect('data_catalog.db')
    cursor = conn.cursor()
    cursor.execute('SELECT COUNT(*) FROM files')
    file_count = cursor.fetchone()[0]
    cursor.execute('SELECT COUNT(*) FROM versions')
    version_count = cursor.fetchone()[0]
    conn.close()
else:
    file_count = 0
    version_count = 0

summary = {
    "task_id": "DATA-004",
    "task_name": "Create data catalog with versioning for Brainomics Localizer",
    "dataset": "Brainomics Localizer",
    "validation_timestamp": datetime.now().isoformat(),
    "status": "success" if (catalog_exists and log_exists) else "failed",
    "checks_performed": {
        "catalog_created": catalog_exists,
        "versions_tracked": log_exists,
        "files_cataloged": file_count,
        "versions_recorded": version_count
    },
    "acceptance_metrics": {
        "catalog_created": catalog_exists,
        "versions_tracked": log_exists
    }
}

print(json.dumps(summary, indent=2))
PYEOF

echo "✓ Generated validation_summary.json"

# Create evidence README
echo ""
echo "Step 6: Creating evidence README..."
cat > "${EVIDENCE_DIR}/README.md" << 'EOF'
# DATA-004 Evidence: Create Data Catalog with Versioning

## Task Description
Create a searchable data catalog with version tracking for Brainomics Localizer dataset.

## Evidence Files

1. **data_catalog.db** - SQLite database catalog (required)
   - Searchable index of all dataset files
   - Includes file paths, sizes, checksums
   - Supports versioning queries

2. **version_log.txt** - Version tracking log (required)
   - Records all catalog versions
   - Describes changes in each version
   - Provides audit trail

3. **validation_summary.json** - Summary of catalog creation
   - Overall status and metrics
   - File counts and version info

## Acceptance Metrics

- **catalog_created**: Database catalog successfully created
- **versions_tracked**: Version log maintained

## Dataset Information

- **Dataset**: Brainomics Localizer
- **Source**: Nilearn datasets
- **Modality**: fMRI contrast maps
EOF

echo "✓ Created evidence README.md"

# Display summary
echo ""
echo "=========================================="
echo "Validation Summary"
echo "=========================================="
cat "${EVIDENCE_DIR}/validation_summary.json" || echo "Summary file not found"

echo ""
echo "Evidence files created:"
ls -lh "${EVIDENCE_DIR}/"
echo "=========================================="

deactivate || true

echo ""
echo "✓ DATA-004 completed successfully!"
echo "Evidence saved to: ${EVIDENCE_DIR}"
