#!/bin/sh

# ANSI escape codes

INFO='\033[1;34m'
RESET='\e[0m' # Reset


function print_version_info() {
  VERSION=$(cat /etc/kindos/system-profile-version)
  DATE=$(cat /etc/kindos/system-profile-date)

  echo -e "KindOS Workspace version ${INFO}${VERSION}${RESET}, last updated: ${INFO}${DATE}${RESET}"
}


if [ -r ~/.kindos.enable ]; then
  if [ -d /etc/profile.d/kindos.d ]; then
    print_version_info
    for i in /etc/profile.d/kindos.d/*.sh; do
      if [ -r $i ]; then
        . $i
      fi
    done
    unset i
  fi
fi