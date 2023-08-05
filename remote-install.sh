#!/bin/sh
set -eu

# To test, run a server in this directory:
#   python -m http.server 9000

# Then test  this script locally:
#   sh <(curl -Ls http://localhost:9000/remote-install.sh) test


# Check if the script is being run with an argument
# In this case it means we want to test a local run
if [ $# -eq 1 ]; then
    # Create a temporary directory
    tmp_dir="$(mktemp -d)"
    cp -a . "$tmp_dir"
    sudo sh "$tmp_dir/install.sh"
    exit 0
fi

# Check if the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use 'sudo' to execute it."
    exit 1
fi

url="https://github.com/KindOS-workspace/system-profile/archive/refs/heads/main.tar.gz"

# Create a temporary directory
tmp_dir="$(mktemp -d)"

# Download the current banch to the temporary directory
curl -Ls https://github.com/KindOS-workspace/system-profile/archive/refs/heads/main.tar.gz -o "$tmp_dir/system-profile.tar.gz"

# Extract the archive
tar -xzf "$tmp_dir/system-profile.tar.gz" -C "$tmp_dir"
exec sh $tmp_dir/system-profile-main/install.sh
