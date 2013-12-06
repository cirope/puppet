ensure_module () {
  if [ ! -d /etc/puppet/modules/$1 ]; then
    puppet module install $2
  else
    puppet module upgrade $2
  fi
}

ensure_module rbenv alup/rbenv
ensure_module postgresql puppetlabs/postgresql
ensure_module apt puppetlabs/apt
ensure_module pear rafaelfc/pear
