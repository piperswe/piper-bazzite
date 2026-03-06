#!/bin/bash

set -ouex pipefail

dnf5 -y config-manager addrepo --from-repofile https://pkg.cloudflare.com/cloudflared.repo
dnf5 -y config-manager addrepo --from-repofile https://pkg.cloudflareclient.com/cloudflare-warp-ascii.repo
dnf5 -y config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
dnf5 copr enable jdxcode/mise
dnf5 install -y \
    cloudflared \
    cloudflare-warp \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin \
    mise \
    zed

systemctl enable docker
