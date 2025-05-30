#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File
systemctl enable podman.socket

echo "[root]" >>/usr/lib/ostree/prepare-root.conf
echo "transient = true" >>/usr/lib/ostree/prepare-root.conf

mkdir /nix

echo "[nix]" >>/usr/lib/ostree/prepare-root.conf
echo "transient = true" >>/usr/lib/ostree/prepare-root.conf
#dnf5 copr enable pgdev/ghostty -y
#dnf5 install -y ghostty
#dnf5 copr disable pgdev/ghostty

dnf5 install -y firefox

#dnf5 install -y 1password

#curl -sSf -L https://install.lix.systems/lix | sh -s -- install ostree
