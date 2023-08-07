#!/bin/bash

# change to the script dir
cd "$(dirname "$0")"

for i in provision.d/*.sh; do
    if [ -r $i ]; then
        echo "Executing $i"
        $i
    fi
done
