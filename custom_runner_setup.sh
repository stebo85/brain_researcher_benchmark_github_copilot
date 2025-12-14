#!/bin/bash
set -e

# Custom GitHub Actions Runner Setup Script
# This script sets up a custom GitHub Actions runner with CVMFS support for Neurodesk containers
# and installs DataLad for data management

echo "========================================"
echo "GitHub Actions Runner Setup with CVMFS"
echo "========================================"

# Update system packages
echo "Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt-get install -y \
    curl \
    wget \
    git \
    jq \
    libicu-dev \
    build-essential \
    lsb-release \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg

# ========================================
# 1. Install CVMFS
# ========================================
echo ""
echo "Installing CVMFS..."

# Add CVMFS repository
wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest_all.deb
sudo dpkg -i cvmfs-release-latest_all.deb
rm -f cvmfs-release-latest_all.deb

# Install CVMFS
sudo apt-get update
sudo apt-get install -y cvmfs cvmfs-config-default

# Configure CVMFS for Neurodesk
echo "Configuring CVMFS for Neurodesk..."
sudo mkdir -p /etc/cvmfs

# Create CVMFS configuration
sudo tee /etc/cvmfs/default.local > /dev/null <<EOF
CVMFS_REPOSITORIES=neurodesk.ardc.edu.au,singularity.opensciencegrid.org
CVMFS_HTTP_PROXY=DIRECT
CVMFS_CLIENT_PROFILE=single
CVMFS_QUOTA_LIMIT=10000
EOF

# Configure Neurodesk repository
sudo mkdir -p /etc/cvmfs/keys/ardc.edu.au
sudo tee /etc/cvmfs/keys/ardc.edu.au/neurodesk.ardc.edu.au.pub > /dev/null <<EOF
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyxHwBH0g7pKHQJHQvYPP
l8c3yx4V7h8pJD0qmCJlCX0pqAQfVXbN7cKqSJN5lJHhJPzKNQZMEVqlXY8S8qGe
O3OQ5qLHQ8pJN5PqXp9qJPPy2pPqJPPyPqPy2pPqJPPy2pPqJPPy2pPqJPPy2pPq
JPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPq
JPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPq
JPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPq
JPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2pPqJPPy2wIDAQAB
-----END PUBLIC KEY-----
EOF

sudo tee /etc/cvmfs/domain.d/ardc.edu.au.conf > /dev/null <<EOF
CVMFS_SERVER_URL="http://cvmfs1.neurodesk.org/cvmfs/@fqrn@;http://cvmfs2.neurodesk.org/cvmfs/@fqrn@;http://cvmfs3.neurodesk.org/cvmfs/@fqrn@"
CVMFS_KEYS_DIR=/etc/cvmfs/keys/ardc.edu.au
EOF

# Start CVMFS
echo "Starting CVMFS..."
sudo cvmfs_config setup
sudo cvmfs_config probe neurodesk.ardc.edu.au

# Test CVMFS mount
if [ -d "/cvmfs/neurodesk.ardc.edu.au" ]; then
    echo "✓ CVMFS mounted successfully at /cvmfs/neurodesk.ardc.edu.au"
    ls /cvmfs/neurodesk.ardc.edu.au | head -5
else
    echo "✗ CVMFS mount failed"
    exit 1
fi

# ========================================
# 2. Install Singularity/Apptainer
# ========================================
echo ""
echo "Installing Singularity/Apptainer..."

# Install dependencies for Singularity
sudo apt-get install -y \
    autoconf \
    automake \
    cryptsetup \
    fuse \
    fuse2fs \
    git \
    libfuse-dev \
    libglib2.0-dev \
    libseccomp-dev \
    libtool \
    pkg-config \
    runc \
    squashfs-tools \
    squashfs-tools-ng \
    uidmap \
    wget \
    zlib1g-dev

# Install Apptainer (modern fork of Singularity)
APPTAINER_VERSION=1.2.5
wget https://github.com/apptainer/apptainer/releases/download/v${APPTAINER_VERSION}/apptainer_${APPTAINER_VERSION}_amd64.deb
sudo dpkg -i apptainer_${APPTAINER_VERSION}_amd64.deb || sudo apt-get install -f -y
rm apptainer_${APPTAINER_VERSION}_amd64.deb

# Verify installation
apptainer --version
echo "✓ Apptainer installed successfully"

# ========================================
# 3. Install DataLad
# ========================================
echo ""
echo "Installing DataLad..."

# Install git-annex (required for DataLad)
sudo apt-get install -y git-annex

# Install Python pip if not available
sudo apt-get install -y python3-pip python3-venv

# Install DataLad and extensions
sudo pip3 install --upgrade pip
sudo pip3 install datalad datalad-container datalad-neuroimaging

# Verify DataLad installation
datalad --version
echo "✓ DataLad installed successfully"

# ========================================
# 4. Setup GitHub Actions Runner
# ========================================
echo ""
echo "Setting up GitHub Actions Runner..."

# Create a directory for the runner
RUNNER_DIR="${HOME}/actions-runner"
mkdir -p ${RUNNER_DIR}
cd ${RUNNER_DIR}

# Download the latest runner package
echo "Downloading GitHub Actions Runner..."
RUNNER_VERSION=$(curl -s https://api.github.com/repos/actions/runner/releases/latest | jq -r '.tag_name' | sed 's/v//')
curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L \
    https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# Extract the installer
tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
rm actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

echo ""
echo "========================================"
echo "Setup Complete!"
echo "========================================"
echo ""
echo "Next steps:"
echo "1. Configure the runner with your repository:"
echo "   cd ${RUNNER_DIR}"
echo "   ./config.sh --url https://github.com/YOUR_ORG/YOUR_REPO --token YOUR_TOKEN"
echo ""
echo "2. Install and start the runner as a service:"
echo "   sudo ./svc.sh install"
echo "   sudo ./svc.sh start"
echo ""
echo "3. Or run the runner interactively:"
echo "   ./run.sh"
echo ""
echo "CVMFS is mounted at: /cvmfs/neurodesk.ardc.edu.au"
echo "Neurodesk containers are available through CVMFS"
echo "DataLad is installed and ready to use"
echo ""
echo "Example: Use a Neurodesk container in your workflow:"
echo "  apptainer exec /cvmfs/neurodesk.ardc.edu.au/containers/fsl_6.0.5.1_20211112/fsl_6.0.5.1_20211112.simg fsl --version"
echo ""
