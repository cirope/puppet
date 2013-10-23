class services {
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
