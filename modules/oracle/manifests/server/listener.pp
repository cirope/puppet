class oracle::server::listener {
  db_listener{ 'startlistener':
    ensure          => 'running',
    oracle_base_dir => '/oracle',
    oracle_home_dir => '/oracle/product/11.2/db',
    os_user         => 'oracle',
    require         => Oradb::Installdb['11.2.0.4_Linux-x86-64']
  }
}