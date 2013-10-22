class locales {
  package { 'locales':
    ensure => present
  }

  file { '/etc/locale.gen':
    source  => 'puppet:///system/locale.gen',
    owner   => root,
    group   => root,
    mode    => 0644,
    require => Package['locales']
  }

  exec { '/usr/sbin/locale-gen':
    subscribe   => File['/etc/locale.gen'],
    user        => 'root',
    refreshonly => true,
    require     => [Package['locales'], File['/etc/locale.gen']]
  }
}
