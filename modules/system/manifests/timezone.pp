class system::timezone {
  package { 'tzdata':
    ensure => present
  }

  file { '/etc/localtime':
    source  => 'file:///usr/share/zoneinfo/America/Argentina/Mendoza',
    links   => follow,
    require => Package['tzdata']
  }
}
