class php::owncloud::datadir {
  file { '/var/lib/owncloud':
    ensure  => directory,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0770',
    require => Package['owncloud']
  }
}
