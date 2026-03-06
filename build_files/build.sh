#!/bin/bash

set -ouex pipefail

dnf5 -y config-manager addrepo --from-repofile https://pkg.cloudflareclient.com/cloudflare-warp-ascii.repo
dnf5 -y config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
dnf5 -y config-manager setopt terra.enabled=1
dnf5 -y install \
    cloudflare-warp \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin \
    mise \
    zed \
    firefox

systemctl enable docker
echo 'g     docker   -              -' > /usr/lib/sysusers.d/docker.conf
