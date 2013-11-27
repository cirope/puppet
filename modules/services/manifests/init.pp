class services($extra = []) {
  service { 'ntp':
    enable  => true,
    ensure  => running,
    require => Package['ntp']
  }

  service { 'puppet':
    enable => false,
    ensure => stopped
  }

  $defaults = {
    enable => true,
    ensure => running
  }

  create_resources(service, $extra, $defaults)
}
