#!/usr/bin/env bash
set -euxo pipefail

rm -rf ./build || true
git submodule foreach --recursive git reset --hard
git submodule foreach --recursive git clean -xfd
git submodule update --init --recursive

"./path 1/path 2/path 3/vcpkg/bootstrap-vcpkg.sh"

cmake -B ./build -S . -DCMAKE_TOOLCHAIN_FILE="./path 1/path 2/path 3/vcpkg/scripts/buildsystems/vcpkg.cmake"
