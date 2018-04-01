#!/usr/bin/env bash

# Make sure our shiny new arch is up-to-date
echo "Checking for system updates..."
sudo pacman -Syu

# Create a tmp-working-dir and navigate into it
mkdir -p /tmp/yay_install
cd /tmp/yay_install

# # If you didn't install the "base-devel" group,
# # we'll need those.
# sudo pacman -S binutils make gcc fakeroot pkg-config --noconfirm --needed

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
