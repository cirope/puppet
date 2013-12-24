class owncloud {
  include owncloud::install
  include owncloud::db

  file { '/var/lib/owncloud':
    ensure  => directory,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0755',
    require => Package['owncloud']
  }
}
