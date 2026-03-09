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
    firefox \
    hplip \
    duperemove \
    ghostty \
    https://kojipkgs.fedoraproject.org/packages/epson-inkjet-printer-escpr/1.7.21/7.1lsb3.2.fc41/x86_64/epson-inkjet-printer-escpr-1.7.21-7.1lsb3.2.fc41.x86_64.rpm

systemctl enable docker
echo 'g     docker   -              -' > /usr/lib/sysusers.d/docker.conf
