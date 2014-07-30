class services {
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

  file { '/usr/bin/service':
    ensure  => link,
    owner   => 'root',
    group   => 'root',
    mode    => '0777',
    target  => '/usr/sbin/service'
  }
}
