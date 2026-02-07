#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Error: INSTALL_PREFIX not set"
    exit 1
fi

INSTALL_PREFIX="$1"

cmake --preset=rel-vcpkg -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
cmake --build build-rel-vcpkg
cmake --install build-rel-vcpkg
