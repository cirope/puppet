class groups {
  group { 'admin':
    ensure => present
  }

  group { 'www-data':
    ensure => present
  }
}
