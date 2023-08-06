#!/bin/sh

# Get the username of the running user
current_user=$(whoami)

if [ -r ~/.kindos.enable ]; then

  if [ -d /etc/profile.d/kindos.d ]; then
    echo "Loading KindOS workspace profile..."  
    for i in /etc/profile.d/kindos.d/*.sh; do
      if [ -r $i ]; then
        . $i
      fi
    done
    unset i
  fi
fi