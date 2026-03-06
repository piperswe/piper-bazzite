#!/bin/bash

set -ouex pipefail

dnf5 -y config-manager addrepo --from-repofile https://pkg.cloudflare.com/cloudflared.repo
dnf5 -y config-manager addrepo --from-repofile https://pkg.cloudflareclient.com/cloudflare-warp-ascii.repo
dnf5 -y config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
dnf5 -y copr enable jdxcode/mise
dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf5 -y install \
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
