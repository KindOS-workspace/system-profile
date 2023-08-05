#!/bin/bash

username="kindos"

# Check if the user already exists
if ! getent passwd "$username" >/dev/null 2>&1; then
    # Add the user with Bash as the default shell
    useradd -m --shell /bin/bash "$username"
    echo "User $username added with Bash as the default shell."
else
    echo "User $username already exists."
fi

set -eu

cp -va debian12/* /
chown -R root:root /etc/sudoers.d
chmod -R 440 /etc/sudoers.d/kindos
