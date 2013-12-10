class owncloud {
  apt::source { 'owncloud':
    ensure      => present,
    location    => 'http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_12.04/',
    release     => '/',
    repos       => '',
    key         => '977C43A8BA684223',
    include_src => false,
  }

  package { 'owncloud':
    ensure  => present,
    require => Apt::Source['owncloud']
  }

  file { '/var/lib/owncloud':
    ensure  => directory,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0755',
    require => Package['owncloud']
  }
}
