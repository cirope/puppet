class locales {
  package { 'locales':
    ensure => present
  }

  file { '/etc/locale.gen':
    source  => 'puppet:///modules/system/locale.gen',
    owner   => root,
    group   => root,
    mode    => 0644,
    require => Package['locales']
  }

  file { '/etc/default/locale':
    source  => 'puppet:///modules/system/locale',
    owner   => root,
    group   => root,
    mode    => 0644,
    require => Package['locales']
  }

  exec { 'locale-gen':
    command     => '/usr/sbin/locale-gen',
    subscribe   => File['/etc/locale.gen'],
    user        => 'root',
    refreshonly => true,
    require     => [Package['locales'], File['/etc/locale.gen']]
  }
}
