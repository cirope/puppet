class services($extra = []) {
  service { 'ntp':
    ensure  => running,
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
