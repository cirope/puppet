#!/usr/bin/env bash

HN=`facter hostname`
APP_SERVER=$HN == 'app' || ($HN != 'web' && $HN != 'db' && $HN != 'php')
DB_SERVER=$HN == 'db' || ($HN != 'web' && $HN != 'app')

ensure_module () {
  if [ ! -d /etc/puppet/modules/$1 ]; then
    puppet module install $2
  fi
}

if [ -f /etc/debian_version ]; then
  ensure_module apt puppetlabs/apt
fi

if [[ $APP_SERVER ]]; then
  ensure_module rbenv alup/rbenv
fi

if [[ $DB_SERVER ]]; then
  ensure_module postgresql puppetlabs/postgresql
fi

if [[ $HN == 'php' ]]; then
  ensure_module pear rafaelfc/pear
fi
