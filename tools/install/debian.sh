#!/usr/bin/env bash

set -eu

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confold" dist-upgrade

apt-get install -y git wget

COLLECTION=pc1
PACKAGE=puppetlabs-release-$COLLECTION-$(lsb_release -s -c).deb
SERVER=http://apt.puppetlabs.com/

wget $SERVER$PACKAGE
dpkg -i $PACKAGE
rm $PACKAGE

apt-get update
apt-get install -y -o Dpkg::Options::="--force-confold" puppet
