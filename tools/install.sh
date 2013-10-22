if [ ! -d /etc/puppet ]; then
  apt-get install -y git-core
  git clone https://github.com/cirope/puppet.git /etc/puppet

  source /etc/puppet/tools/install_puppet.sh
  source /etc/puppet/tools/vendor_modules.sh
else
  cd /etc/puppet
  git clean -f -d
  git pull
fi

puppet apply /etc/puppet/manifests/site.pp
