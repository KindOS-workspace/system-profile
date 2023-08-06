#!/bin/bash

INFO='\033[1;34m'
RESET='\e[0m' # Reset


function try_import() {
    function info() {
        echo -e "${INFO}$1${RESET}"
    }

    check_paths=".ssh .gitconfig .github_username"

    # check which files exist in the userprofile
    FOUND_PATHS=()
    for path in $check_paths; do
        if [[ -r $USERPROFILE/$path ]]; then
            FOUND_PATHS+=($path)
        fi
    done

    # print info
    PATH_COUNT=${#FOUND_PATHS[@]}
    if [[ $PATH_COUNT -gt 0 ]]; then
        echo "Importing $(info $PATH_COUNT) files from $(info $USERPROFILE): ${FOUND_PATHS[@]}"
    fi

    for path in $check_paths; do
        if [[ -r $USERPROFILE/$path ]]; then
            rm -rf ${HOME}/${path}
            cp -r ${USERPROFILE}/${path} ${HOME}
            chmod -R og-rwx ${HOME}/${path}   # To avoid "Bad owner or permissions on $HOME/.ssh/config"
        fi
    done

}
# check if userprofile is set
[[ -n "${USERPROFILE}" ]] && try_import

