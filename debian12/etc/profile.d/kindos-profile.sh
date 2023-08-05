#!/bin/sh

# Get the username of the running user
current_user=$(whoami)


echo "Loading KindOS workspace profile..."

if [ -d /etc/profile.d/kindos ]; then
  for i in /etc/profile.d/kindos/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
