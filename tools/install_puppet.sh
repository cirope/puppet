#!/usr/bin/env bash

if [ ! -f /usr/bin/puppet ]; then
  if [ -f /etc/arch-release ]; then
    source /etc/puppet/tools/install/archlinux.sh
  elif [ -f /etc/debian_version ]; then
    source /etc/puppet/tools/install/debian.sh
  elif [ -f /etc/redhat-release ]; then
    source /etc/puppet/tools/install/redhat.sh
  fi
fi
