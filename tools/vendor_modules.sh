#!/usr/bin/env bash

source /etc/puppet/tools/distro.sh

HN=`facter hostname`

if [[ $HN == 'php' || $HN == 'owncloud' ]]; then PHP_SERVER=true; fi
if [[ $HN == 'app' || ($HN != 'web' && $HN != 'db' && ! $PHP_SERVER) ]]; then APP_SERVER=true; fi
if [[ $HN == 'db'  || ($HN != 'web' && $HN != 'app') ]]; then DB_SERVER=true; fi

ensure_module () {
  if [ ! -d /etc/puppet/modules/$1 ]; then puppet module install $2; fi
}

if [[ $DEBIAN ]];     then ensure_module apt puppetlabs/apt; fi
if [[ $APP_SERVER ]]; then ensure_module rbenv alup/rbenv; fi
if [[ $DB_SERVER ]];  then ensure_module postgresql puppetlabs/postgresql; fi
