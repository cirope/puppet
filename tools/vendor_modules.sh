#!/usr/bin/env bash
set +u

HN=`facter hostname`

if [[ $HN == 'app' || ($HN != 'web' && $HN != 'db') ]]; then APP_SERVER=true; fi
if [[ $HN == 'db'  || ($HN != 'web' && $HN != 'app') ]]; then DB_SERVER=true; fi

ensure_module () {
  if [ ! -d /etc/puppet/modules/$1 ]; then
    puppet module install $2;
  fi
}

if [ -f /etc/debian_version ]; then
  ensure_module apt puppetlabs/apt;
fi

if [ -f /etc/redhat-release ]; then
  ensure_module epel stahnma/epel;
fi

if [[ $APP_SERVER ]]; then
  ensure_module mongodb puppetlabs/nodejs;
fi

if [[ $DB_SERVER ]]; then
  ensure_module mongodb puppetlabs/mongodb;
fi
