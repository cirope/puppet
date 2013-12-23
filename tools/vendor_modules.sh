#!/usr/bin/env bash

ensure_module () {
  if [ ! -d /etc/puppet/modules/$1 ]; then
    puppet module install $2
  fi
}

HOSTNAME=`uname -n`

if [ -f /etc/debian_version ]; then
  ensure_module apt puppetlabs/apt
fi

if [[ $HOSTNAME == 'app' || ($HOSTNAME != 'web' && $HOSTNAME != 'db') ]]; then
  ensure_module rbenv alup/rbenv
fi

if [[ $HOSTNAME == 'db' || ($HOSTNAME != 'web' && $HOSTNAME != 'app') ]]; then
  ensure_module postgresql puppetlabs/postgresql
fi

if [[ $HOSTNAME == 'php' ]]; then
  ensure_module pear rafaelfc/pear
fi
