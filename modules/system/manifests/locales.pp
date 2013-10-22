class locales {
  package { 'locales':
    ensure => present
  }

  package { 'language-pack-es':
    ensure  => present,
    require => Package['locales']
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
    user        => root,
    refreshonly => true,
    subscribe   => File['/etc/locale.gen'],
    require     => [Package['locales'], File['/etc/locale.gen']]
  }

  exec { 'update-locale'
    user        => root,
    refreshonly => true,
    subscribe   => File['/etc/default/locale'],
    require     => [Exec['locale-gen'], File['/etc/default/locale']]
  }
}
