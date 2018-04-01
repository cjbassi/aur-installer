#!/usr/bin/env bash

# Create a tmp-working-dir and navigate into it
mkdir -p /tmp/yay_install
cd /tmp/yay_install

# Install build dependencies if the "base-devel" group isn't installed
sudo pacman -Sy --noconfirm --needed binutils make gcc fakeroot pkg-config

# # Install yay dependencies from arch repos
# sudo pacman -S expac yajl git --noconfirm --needed

# Install "yay" from AUR
if [[ ! -n "$(pacman -Qs yay)" ]]; then
    curl https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yay > PKGBUILD
    makepkg -si --needed --noconfirm
fi

# Clean up...
cd ~
rm -r /tmp/yay_install
