#!/usr/bin/env bash

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confold" dist-upgrade

apt-get install -y git wget

PACKAGE=puppetlabs-release-precise.deb
SERVER=http://apt.puppetlabs.com/

wget $SERVER$PACKAGE
dpkg -i $PACKAGE
rm $PACKAGE

apt-get install -y -o Dpkg::Options::="--force-confold" puppet
