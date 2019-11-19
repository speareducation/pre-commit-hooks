#!/bin/bash

#description  :Run SwiftLint on modified files.
#author       :Rob Lester
#date         :11/18/19
#version      :0.0.1
#bash_version :3.2.57

set -e

SWIFT_LINT=./Pods/SwiftLint/swiftlint

if ! [[ -e "${SWIFT_LINT}" ]]; then
    echo "${SWIFT_LINT} is not installed."
    exit 0
fi

MODIFIED_FILES=${@:1}

if ((${#MODIFIED_FILES[@]})); then
    swiftlint -- ${@:1}
fi