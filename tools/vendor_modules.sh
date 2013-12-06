ensure_module () {
  puppet module install --force $1
}

ensure_module alup/rbenv
ensure_module puppetlabs/apt
ensure_module puppetlabs/postgresql
ensure_module rafaelfc/pear
