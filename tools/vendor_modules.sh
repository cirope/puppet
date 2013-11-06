install_module () {
  if [ ! -d /etc/puppet/modules/$1 ]; then
    puppet module install $2
  fi
}

install_module rbenv alup/rbenv
install_module postgresql puppetlabs/postgresql 
install_module nginx puppet puppetlabs/nginx
