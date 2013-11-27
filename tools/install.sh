if [ ! -d /etc/puppet ]; then
  apt-get install -y git
  git clone https://github.com/cirope/puppet.git /etc/puppet

  sh /etc/puppet/tools/install_puppet.sh
else
  cd /etc/puppet
  git clean -f -d
  git pull
fi

sh /etc/puppet/tools/vendor_modules.sh
puppet apply /etc/puppet/manifests/site.pp
