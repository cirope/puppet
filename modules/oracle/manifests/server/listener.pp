class oracle::server::listener {
  db_listener { 'listener':
    ensure          => 'running',
    oracle_base_dir => $oracle::server::base,
    oracle_home_dir => $oracle::server::home,
    os_user         => $oracle::server::user,
    require         => Oradb::Installdb["${oracle::server::version}_Linux-x86-64"]
  }

  service { 'dbora':
    enable  => true,
    require => Oradb::Installdb["${oracle::server::version}_Linux-x86-64"]
  }
}
