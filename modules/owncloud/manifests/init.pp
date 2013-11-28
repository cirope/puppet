class owncloud {
  class { 'apt': }

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
}
