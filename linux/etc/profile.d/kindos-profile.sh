#!/bin/sh

# ANSI escape codes

INFO='\033[1;34m'
RESET='\e[0m' # Reset


function print_info() {
  VERSION=$(cat /etc/kindos/system-profile-version)
  DATE=$(cat /etc/kindos/system-profile-date)

  echo -e "KindOS Workspace version ${INFO}${VERSION}${RESET}, last updated: ${INFO}${DATE}${RESET}"
  echo $(sdkinit --installed) - $(sdkinit --available)
}

# Get list of installed SDKs
installed_sdks=($(ls -d /usr/local/sdkinit/* | xargs -n 1 basename| grep -v "\.files"))


if [ -r ~/.kindos.enable ]; then
  if [ -d /etc/profile.d/kindos.d ]; then
    print_info
    for i in /etc/profile.d/kindos.d/*.sh; do
      if [ -r $i ]; then
        . $i
      fi
    done
    unset i
  fi
fi