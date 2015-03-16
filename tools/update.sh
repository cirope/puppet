#!/usr/bin/env bash
set -e

cd /etc/puppet
git clean -f -d
git pull origin meteor

source /etc/puppet/tools/vendor_modules.sh
puppet apply /etc/puppet/manifests
