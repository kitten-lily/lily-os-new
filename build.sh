#!/bin/bash

set -oue pipefail

container=$(buildah from --pull=newer \
    --volume $(pwd)/build_files:/build_files:O \
ghcr.io/ublue-os/bluefin-dx:beta)

buildah copy $container system_files /

for filename in build_files/*-*.sh; do
    echo "===$(basename "$filename" ".sh")==="
    buildah run \
        --mount=type=cache,dst=/var/cache \
        --mount=type=cache,dst=/var/log \
        --mount=type=tmpfs,dst=/tmp \
        $container /build_files/$(basename "$filename")
done

buildah run \
    $container /build_files/cleanup.sh

buildah commit --rm $container lily-os
