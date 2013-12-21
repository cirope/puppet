class services($extra = {}) {
  $ntp_service_name = $::osfamily ? {
    debian  => 'ntp',
    default => 'ntpd'
  }

  service { 'ntp':
    ensure  => running,
    name    => $ntp_service_name,
    enable  => true,
    require => Package['ntp']
  }

  service { 'puppet':
    ensure => stopped,
    enable => false
  }

  $defaults = {
    ensure => running,
    enable => true
  }

  create_resources('service', $extra, $defaults)
}
