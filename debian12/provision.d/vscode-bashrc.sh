#!/bin/sh
set -eu

# This is neeed because bashrc will be sourced by vscode and it will override PS1
sed -i '/vscode/d' /etc/bash.bashrc
echo '[[ "TERM_PROGRAM"=vscode ]] && source /etc/profile.d/kindos.d/prompt.sh' >> /etc/bash.bashrc
