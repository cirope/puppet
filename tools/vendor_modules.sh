if [ ! -d /etc/puppet/modules/rbenv ]; then
  puppet module install alup/rbenv
fi

if [ ! -d /etc/puppet/modules/postgresql_puppet ]; then
  puppet module install --target-dir /etc/puppet/modules/postgresql_puppetlabs puppetlabs/postgresql 
fi
