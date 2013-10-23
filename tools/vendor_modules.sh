if [ ! -d /etc/puppet/modules/rbenv ]; then
  puppet module install alup/rbenv
fi

if [ ! -d /etc/puppet/modules/postgresql ]; then
  puppet module install puppetlabs/postgresql 
fi
