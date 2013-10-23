class root {
  $profile = '/root/.profile'

  file { $profile:
    ensure  => file,
    owner   => root,
    group   => root,
    source  => 'puppet:///modules/root/.profile'
  }
}
