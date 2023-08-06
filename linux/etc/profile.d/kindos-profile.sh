#!/bin/sh
set -eu

function print_verion() {
  VERSION=$(cat /etc/kindos/system-profile-version)
  DATE=$(cat /etc/kindos/system-profile-date)

  echo -e "\033[1;34mLoading KindOS Workspace version 63f5812,\033[0m"
  echo -e "\033[1;34mlast updated: \033[1;32mSun Aug  6 05:52:25 PM CEST 2023\033[0m"
  #echo "KindOS Workspace version $(cat /etc/kindos/system-profile-version), last updated: $(cat /etc/kindos/system-profile-date)"
}


if [ -r ~/.kindos.enable ]; then
  if [ -d /etc/profile.d/kindos.d ]; then
    for i in /etc/profile.d/kindos.d/*.sh; do
      if [ -r $i ]; then
        . $i
      fi
    done
    unset i
  fi
fi