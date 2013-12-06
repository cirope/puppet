cd /etc/puppet
git pull

sh /etc/puppet/tools/vendor_modules.sh
puppet apply /etc/puppet/manifests/site.pp
