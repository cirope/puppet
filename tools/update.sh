cd /etc/puppet
git clean -f -d
git pull

sh /etc/puppet/tools/vendor_modules.sh
puppet apply /etc/puppet/manifests/site.pp
