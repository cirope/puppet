#!/usr/bin/env bash

install_git () {
  if [ -f /etc/debian_version ]; then
    apt-get install -y git
  elif [ -f /etc/arch-release ]; then
    pacman -S --needed --noconfirm git
  elif [ -f /etc/redhat-release ]; then
    yum -y install git
  fi
}

if [ ! -d /etc/puppet ]; then
  install_git

  git clone https://github.com/cirope/puppet.git /etc/puppet

  source /etc/puppet/tools/install_puppet.sh
fi

source /etc/puppet/tools/update.sh
ln -sf /etc/puppet/tools/update.sh /sbin/puppet-update
