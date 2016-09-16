class redis::install::debian {
  package { 'redis-server':
    ensure => present
  }

  service { 'redis-server':
    ensure  => running,
    enable  => true,
    require => Package['redis-server']
  }
}
