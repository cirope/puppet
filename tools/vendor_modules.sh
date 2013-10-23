if [ ! -d /etc/puppet/rbenv ]; then
  puppet module install alup/rbenv
fi

if [ ! -d /etc/puppet/postgresql ]; then
  puppet module install puppetlabs/postgresql 
fi
