#!/usr/bin/env bash

yum -y update
yum -y install git

COLLECTION=pc1
OS=el
VERSION=7

rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-$COLLECTION-$OS-$VERSION.noarch.rpm
yum -y install puppet
