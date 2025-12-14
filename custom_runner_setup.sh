#!/bin/bash
ssh ubuntu@149.165.150.131
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
    git-lfs \
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
sudo mkdir -p /etc/cvmfs/keys/ardc.edu.au/


echo "-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwUPEmxDp217SAtZxaBep
Bi2TQcLoh5AJ//HSIz68ypjOGFjwExGlHb95Frhu1SpcH5OASbV+jJ60oEBLi3sD
qA6rGYt9kVi90lWvEjQnhBkPb0uWcp1gNqQAUocybCzHvoiG3fUzAe259CrK09qR
pX8sZhgK3eHlfx4ycyMiIQeg66AHlgVCJ2fKa6fl1vnh6adJEPULmn6vZnevvUke
I6U1VcYTKm5dPMrOlY/fGimKlyWvivzVv1laa5TAR2Dt4CfdQncOz+rkXmWjLjkD
87WMiTgtKybsmMLb2yCGSgLSArlSWhbMA0MaZSzAwE9PJKCCMvTANo5644zc8jBe
NQIDAQAB
-----END PUBLIC KEY-----" | sudo tee /etc/cvmfs/keys/ardc.edu.au/neurodesk.ardc.edu.au.pub

echo "CVMFS_USE_GEOAPI=yes" | sudo tee /etc/cvmfs/config.d/neurodesk.ardc.edu.au.conf

echo 'CVMFS_SERVER_URL="http://cvmfs-jetstream.neurodesk.org/cvmfs/@fqrn@;http://s1osggoc-cvmfs.openhtc.io:8080/cvmfs/@fqrn@;http://s1fnal-cvmfs.openhtc.io:8080/cvmfs/@fqrn@;http://s1bnl-cvmfs.openhtc.io/cvmfs/@fqrn@"' | sudo tee -a /etc/cvmfs/config.d/neurodesk.ardc.edu.au.conf 

echo 'CVMFS_KEYS_DIR="/etc/cvmfs/keys/ardc.edu.au/"' | sudo tee -a /etc/cvmfs/config.d/neurodesk.ardc.edu.au.conf

echo "CVMFS_HTTP_PROXY=DIRECT" | sudo tee  /etc/cvmfs/default.local
echo "CVMFS_QUOTA_LIMIT=5000" | sudo tee -a  /etc/cvmfs/default.local

sudo cvmfs_config setup


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
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:apptainer/ppa
sudo apt-get update
sudo apt-get install -y apptainer
sudo apt-get install -y apptainer-suid

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

# Install DataLad and extensions from neurodebian
python3 -m venv /home/ubuntu/venv_runner
source /home/ubuntu/venv_runner/bin/activate
pip install datalad-installer
datalad-installer git-annex -m datalad/packages
pip install datalad

# Verify DataLad installation
datalad --version
echo "✓ DataLad installed successfully"


# setup lmod
sudo apt install lmod

# Create a the new file /usr/share/module.sh with the content (NOTE: update the version, here 6.6, with your lmod version, e.g. 6.6 (Ubuntu 20.04/22.04), 8.6.19 (Ubuntu 24.04)):

sudo vi /usr/share/module.sh

# system-wide profile.modules                                          #
# Initialize modules for all sh-derivative shells                      #
#----------------------------------------------------------------------#
trap "" 1 2 3

case "$0" in
    -bash|bash|*/bash) . /usr/share/lmod/8.6.19/init/bash ;;
       -ksh|ksh|*/ksh) . /usr/share/lmod/8.6.19/init/ksh ;;
       -zsh|zsh|*/zsh) . /usr/share/lmod/8.6.19/init/zsh ;;
          -sh|sh|*/sh) . /usr/share/lmod/8.6.19/init/sh ;;
                    *) . /usr/share/lmod/8.6.19/init/sh ;;  # default for scripts
esac

trap - 1 2 3

vi ~/.bashrc

# add the following: 

if [ -f '/usr/share/module.sh' ]; then source /usr/share/module.sh; fi

if [ -d /cvmfs/neurodesk.ardc.edu.au/neurodesk-modules ]; then
        # export MODULEPATH="/cvmfs/neurodesk.ardc.edu.au/neurodesk-modules"
        module use /cvmfs/neurodesk.ardc.edu.au/neurodesk-modules/*
else
        export MODULEPATH="/neurodesktop-storage/containers/modules"              
        module use $MODULEPATH
        export CVMFS_DISABLE=true
fi

if [ -f '/usr/share/module.sh' ]; then
        echo 'Run "ml av" to see which tools are available - use "ml <tool>" to use them in this shell.'
        if [ -v "$CVMFS_DISABLE" ]; then
                if [ ! -d $MODULEPATH ]; then
                        echo 'Neurodesk tools not yet downloaded. Choose tools to install from the Application menu.'
                fi
        fi
fi

export APPTAINER_BINDPATH='/cvmfs,/mnt,/home'


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
