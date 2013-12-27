#!/usr/bin/env bash

if   [ -f /etc/arch-release ];   then ARCHLINUX=true
elif [ -f /etc/debian_version ]; then DEBIAN=true
elif [ -f /etc/redhat-release ]; then REDHAT=true
fi

upgrade () {
  if   [ $ARCHLINUX ]; then pacman -Syu --noconfirm
  elif [ $DEBIAN ];    then apt-get update; apt-get dist-upgrade -y
  elif [ $REDHAT ];    then yum -y update
  fi
}

install_git () {
  if   [ $ARCHLINUX ]; then pacman -S --needed --noconfirm git
  elif [ $DEBIAN ];    then apt-get install -y git
  elif [ $REDHAT ];    then yum -y install git
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
