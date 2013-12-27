#!/usr/bin/env bash

upgrade () {
  if [ -f /etc/debian_version ]; then
    apt-get update
    apt-get dist-upgrade -y
  elif [ -f /etc/arch-release ]; then
    pacman -Syu --noconfirm
  elif [ -f /etc/redhat-release ]; then
    yum -y update
  fi
}

install_git () {
  if [ -f /etc/debian_version ]; then
    apt-get install -y git
  elif [ -f /etc/arch-release ]; then
    pacman -S --needed --noconfirm git
  elif [ -f /etc/redhat-release ]; then
    yum -y install git
  fi
}

upgrade

if [ ! -d /etc/puppet/.git ]; then
  rm -rf /etc/puppet

  install_git

  git clone https://github.com/cirope/puppet.git /etc/puppet

  source /etc/puppet/tools/install_puppet.sh
fi

source /etc/puppet/tools/update.sh
ln -sf /etc/puppet/tools/update.sh /sbin/puppet-update
