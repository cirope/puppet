if [ ! -d /etc/puppet ]; then
  apt-get install -y git
  git clone https://github.com/cirope/puppet.git /etc/puppet

  sh /etc/puppet/tools/install_puppet.sh
fi

sh /etc/puppet/tools/update.sh
ln -sf /sbin/puppet-update /etc/puppet/tools/update.sh
