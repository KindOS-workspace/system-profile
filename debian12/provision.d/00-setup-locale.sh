#!/bin/bash
set -eu

grep -q "LANG" /etc/default/locale  && exit 0

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
}

