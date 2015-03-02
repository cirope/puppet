#!/usr/bin/env bash
set -eu

if   [ -f /etc/arch-release ];   then export SCRIPT=archlinux.sh
elif [ -f /etc/debian_version ]; then export SCRIPT=debian.sh
elif [ -f /etc/redhat-release ]; then export SCRIPT=redhat.sh
fi

URL=https://raw.githubusercontent.com/cirope/puppet/oracle/tools/install/$SCRIPT

(wget $URL -O - 2>/dev/null || curl -L $URL) | bash

if [ ! -d /etc/puppet/.git ]; then
  rm -rf /etc/puppet
  git clone https://github.com/cirope/puppet.git /etc/puppet

  cd /etc/puppet
  git checkout oracle
fi

source /etc/puppet/tools/update.sh
ln -sf /etc/puppet/tools/update.sh /sbin/puppet-update
