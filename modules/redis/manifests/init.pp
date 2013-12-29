class redis {
  $package = $::osfamily ? {
    debian  => 'redis-server',
    default => 'redis'
  }

  $service = $package

  package { $package:
    ensure => present
  }

  service { $service:
    ensure  => running,
    enable  => true,
    require => Package[$package]
  }
}
