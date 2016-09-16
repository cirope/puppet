class redis::install::archlinux {
  package { 'redis':
    ensure => present
  }

  service { 'redis':
    ensure  => running,
    enable  => true,
    require => Package['redis']
  }
}
