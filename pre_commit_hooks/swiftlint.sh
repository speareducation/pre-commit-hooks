#!/bin/bash
set -e

SWIFT_LINT=./Pods/SwiftLint/swiftlint

if ! [[ -e "${SWIFT_LINT}" ]]; then
    echo "${SWIFT_LINT} is not installed."
    exit 0
fi

modified_files=${@:1}

if (( ${#modified_files[@]} )); then
    swiftlint -- ${@:1}
fi

