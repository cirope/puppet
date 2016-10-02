#!/usr/bin/env bash

set -eu

pacman -Syu --noconfirm
pacman -S --needed --noconfirm git base-devel wget

wget https://aur.archlinux.org/packages/pu/puppet/puppet.tar.gz

tar -xzf puppet.tar.gz
cd puppet
makepkg -s --asroot
pacman -U --noconfirm puppet*.tar.xz

cd ..
rm puppet.tar.gz
rm -rf puppet/
