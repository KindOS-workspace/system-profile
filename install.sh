#!/bin/bash

set -eu

# Change to the directory from which the script is being run
cd "$(dirname "$0")"

# Check if the first argument is "test"
if [ "${1:-}" = "--test" ]; then
    test_mode="true"
else
    test_mode="false"
fi

# Check if is running with root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root"
    exit 1
fi



# Check if the script is being run as in test mode
echo "Installing the KindOS Workspace profile"

username="kindos"

# Check if the user already exists
if ! getent passwd "$username" >/dev/null 2>&1; then
    # Add the user with Bash as the default shell
    useradd -c "www.kindos.org" -k /dev/null -m --shell /bin/bash "$username"
    echo "User $username created with Bash as the default shell."
    touch /home/$username/.kindos.enable
fi


rm -rf /etc/profile.d/kindos.d
cp -r linux/* /
chmod 644 /etc/profile.d/kindos-profile.sh /etc/profile.d/kindos.d/*.sh
chmod 755 /usr/local/bin/*
chmod 755 /usr/local/sdkinit/*
debian12/provision.sh


install -d -m 755 /etc/kindos

echo $(git rev-parse --short HEAD) > /etc/kindos/system-profile-version
date > /etc/kindos/system-profile-date

# Check if running in test mode
if [ "$test_mode" = "true" ]; then
    # Run the SDK initialization script in test mode
    echo "Running the test suite..."
    sudo su - "$username" -c "sdkinit mamba"
    echo "Done"
else
    # Always perform a basic test
    sudo su - "$username" -c "true"
fi

GREEN='\033[0;32m'       # ANSI escape code for green text color
NC='\033[0m'             # ANSI escape code to reset text color

echo -e "${GREEN}✔ KindOS Workspace profile installed successfully${NC}"
