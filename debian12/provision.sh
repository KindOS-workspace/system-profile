#!/bin/bash

# change to the script dir
cd "$(dirname "$0")"

LOCALE=${1:-en_US.UTF-8}

cat <<EOF > /etc/default/locale
LANG="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
EOF

echo "locales locales/default_environment_locale select $LOCALE" | debconf-set-selections
echo "locales locales/locales_to_be_generated multiselect $LOCALE UTF-8" | debconf-set-selections
rm "/etc/locale.gen"
dpkg-reconfigure --frontend noninteractive locales


# This is neeed because bashrc will be sourced by vscode and it will override PS1

sed -i '/vscode/d' /etc/bash.bashrc
echo '[[ "TERM_PROGRAM"=vscode ]] && source /etc/profile.d/kindos.d/prompt.sh' >> /etc/bash.bashrc

