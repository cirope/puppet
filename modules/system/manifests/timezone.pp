class timezone {
  package { 'tzdata':
    ensure => present
  }

  file { '/etc/localtime':
    require => Package['tzdata'],
    source  => 'file:///usr/share/zoneinfo/America/Argentina/Mendoza',
  }
}
