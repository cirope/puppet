#!/usr/bin/env bash

yum -y update
yum -y install git

rpm -ivh http://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-11.noarch.rpm
yum -y install puppet
