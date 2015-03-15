class oracle::server::listener {
  db_listener { 'listener':
    ensure          => 'running',
    oracle_base_dir => '/oracle',
    oracle_home_dir => '/oracle/product/11.2/db',
    os_user         => 'oracle',
    require         => Oradb::Installdb["${oracle::server::version}_Linux-x86-64"]
  }
}
