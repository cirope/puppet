class redis::install::redhat {
  package { 'redis':
    ensure  => present,
    require => Class['system::initializers::redhat']
  }

  service { 'redis':
    ensure  => running,
    enable  => true,
    require => Package['redis-server']
  }
}
