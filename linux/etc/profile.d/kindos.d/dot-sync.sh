#!/bin/bash

BLUE='\e[0;34m' # Blue
WHITE='\e[0;37m' # White
BOLD='\e[1m' # Bold
RESET='\e[0m' # Reset

function check_default_file {
    filename=$1
    if [[ -r $USERPROFILE/$filename ]]; then
        rm -rf ${HOME}/${filename}
        echo -e "Imported $filename from ${USERPROFILE} to ~"
        cp -r ${USERPROFILE}/${filename} ${HOME}
        chmod -R og-rwx ${HOME}/${filename}   # To avoid "Bad owner or permissions on $HOME/.ssh/config"
    fi
}

# check if userprofile is set
if [[ -n "${USERPROFILE}" ]]; then
    check_default_file .ssh
    check_default_file .gitconfig
fi
