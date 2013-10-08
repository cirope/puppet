#!/usr/bin/env bash

PACKAGE=puppetlabs-release-precise.deb
SERVER=http://apt.puppetlabs.com/ 

wget $SERVER$PACKAGE
dpkg -i $PACKAGE
rm $PACKAGE

apt-get update
apt-get -y dist-upgrade
apt-get install -y puppet
