class system::locales::archlinux {
  file { 'local':
    path    => '/etc/locale.gen',
    source  => 'puppet:///modules/system/locale.gen',
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }

  exec { 'locale-gen':
    user        => 'root',
    refreshonly => true,
    subscribe   => File['local'],
    require     => File['local']
  }
}
