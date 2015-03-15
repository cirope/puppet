class oracle::server::listener {
  db_listener { 'listener':
    ensure          => 'running',
    oracle_base_dir => '/oracle',
    oracle_home_dir => '/oracle/product/11.2/db',
    os_user         => $oracle::server::user,
    require         => Oradb::Installdb["${oracle::server::version}_Linux-x86-64"]
  }

  service { 'oracle_lsnr':
    enable  => true,
    require => File['/etc/init.d/oracle_lsnr']
  }

  file { '/etc/init.d/oracle_lsnr':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('oracle/init.sh.erb')
  }
}
