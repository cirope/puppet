class services {
  service { 'postgresql':
    enable  => true,
    ensure  => running,
    require => Package['postgresql']
  }

  service { 'ntp':
    enable  => true,
    ensure  => running,
    require => Package['ntp']
  }

  service { 'puppet':
    enable => false,
    ensure => stopped
  }
}
