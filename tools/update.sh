#!/usr/bin/env bash
set -e

cd /etc/puppet
git clean -f -d
# TODO: remove when migration is complete
git checkout puppet-4
git pull

source /etc/puppet/tools/vendor_modules.sh
puppet apply /etc/puppet/manifests
