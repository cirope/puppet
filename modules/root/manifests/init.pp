class root {
  $profile = '/root/.profile'

  file { $profile:
    ensure  => file,
    owner   => root,
    group   => root,
    source  => 'puppet:///modules/root/.profile',
    require => Exec['update-locale']
  }

  exec { 'root-profile-refresh':
    command     => "bash -c 'source $profile'",
    user        => root,
    refreshonly => true,
    subscribe   => File[$profile],
    require     => File[$profile]
  }
}
