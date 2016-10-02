#!/usr/bin/env bash

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confold" dist-upgrade

apt-get install -y git wget

COLLECTION=pc1
RELEASE_NAME=$(lsb_release -s -c)

if [ "$RELEASE_NAME" == "xenial" ]; then
  PACKAGE=puppetlabs-release-$COLLECTION-$RELEASE_NAME.deb
else
  PACKAGE=puppetlabs-release-$RELEASE_NAME.deb
fi

SERVER=http://apt.puppetlabs.com/

wget $SERVER$PACKAGE
dpkg -i $PACKAGE
rm $PACKAGE

apt-get update
apt-get install -y -o Dpkg::Options::="--force-confold" puppet
