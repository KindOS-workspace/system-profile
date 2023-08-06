#!/bin/bash

sed -i '/vscode/d' /etc/bash.bashrc
echo '[[ "TERM_PROGRAM"=vscode ]] && source /etc/profile.d/kindos.d/prompt.sh' >> /etc/bash.bashrc
