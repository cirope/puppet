class services {
  service { 'postgresql':
    enable    => true,
    ensure    => running,
    hasstatus => true,
    require   => Package['postgresql']
  }

  service { 'ntp':
    enable    => true,
    ensure    => running,
    hasstatus => true,
    require   => Package['ntp']
  }
}
