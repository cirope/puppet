class nodejs {
  if $::operatingsystem == 'Debian' {
    package { 'nodejs':
      ensure  => present,
      require => Class['apt::backports']
    }
  } else {
    package { 'nodejs':
      ensure => present
    }
  }
}
