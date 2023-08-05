#!/bin/bash

# Chane to the directory from which the script is being run
cd "$(dirname "$0")"

# Check if the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use 'sudo' to execute it."
    exit 1
fi

username="kindos"

# Check if the user already exists
if ! getent passwd "$username" >/dev/null 2>&1; then
    # Add the user with Bash as the default shell
    useradd -m --shell /bin/bash "$username"
    echo "User $username added with Bash as the default shell."
else
    echo "User $username found - OK."
fi

set -eu

cp -r debian12/* /
chown -R root:root /etc/sudoers.d
chmod -R 440 /etc/sudoers.d/kindos

echo "Installation completed successfully."
