#!/usr/bin/env bash
set -eu

cd /etc/puppet
git clean -f -d
git pull

source /etc/puppet/tools/vendor_modules.sh
puppet apply /etc/puppet/manifests/site.pp
