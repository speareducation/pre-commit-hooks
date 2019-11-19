#!/bin/bash

#description  :Validate that the Podfile and Podfile.lock do not contain the local user's path.
#author       :Rob Lester
#date         :11/19/19
#version      :0.0.1
#bash_version :3.2.57

set -e

HOME_FOLDER_PATH=~
MODIFIED_FILES=${@:1}

if ((${#MODIFIED_FILES[@]})); then
    for filename in $MODIFIED_FILES; do
        echo $filename
        if grep -q $HOME_FOLDER_PATH "$filename"; then
            echo -e "Found local path in file: ${filename}"
            echo -e "To resolve run: 'unset DEVELOPMENT_SPEAR_SWIFT_PATH && pod install' then re-commit."
            exit -1
        fi
    done
fi