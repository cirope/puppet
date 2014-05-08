class system::locales::ubuntu {
  package { 'locales':
    ensure => present
  }

  package { 'language-pack-es':
    ensure => present
  }

  file { 'locale.gen':
    path    => '/etc/locale.gen',
    source  => 'puppet:///modules/system/locale.gen',
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }

  exec { 'locale-gen':
    user        => 'root',
    refreshonly => true,
    subscribe   => File['locale.gen'],
    require     => [
      File['locale.gen'],
      Package['locales'],
      Package['language-pack-es']
    ]
  }
}
