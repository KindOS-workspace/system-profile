#/bin/bash

# DESCRIPTION: Provides a custom prompt wich reports git status and success/failure of the last command


function parse_git_dirty {
    [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}
function parse_cwd {
    [[ -n "$USERPROFILE" ]] && echo $(pwd) | sed -e "s#${HOME}#~#" | sed -e "s#${USERPROFILE}#\$USERPROFILE#"
}
function last_status {
    [[ $? -eq 0 ]] && echo -e "✔" || echo -e "❌"
}

export PS1=" \$(last_status)\n\t \[\033[32m\]\$(parse_cwd)\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export SUDO_PS1=$PS1