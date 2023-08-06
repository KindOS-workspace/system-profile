#!/bin/bash

set -eu

# Check if the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use 'sudo' to execute it."
    exit 1
fi

# Change to the directory from which the script is being run
cd "$(dirname "$0")"

username="kindos"

# Check if the user already exists
if ! getent passwd "$username" >/dev/null 2>&1; then
    # Add the user with Bash as the default shell
    useradd -m --shell /bin/bash "$username"
    echo "User $username created with Bash as the default shell."
    touch /home/$username/.kindos.enable
fi


rm -rf /etc/profile.d/kindos.d
cp -r linux/* /
debian12/provision.sh


install -d -m 755 /etc/kindos

echo $(git rev-parse --short HEAD) > /etc/kindos/system-profile-version
date > /etc/kindos/system-profile-date

echo "Loading the new profile for testing"

# Perform a test
su - "$username" -c true

echo -e "✔ Completed successfully"


