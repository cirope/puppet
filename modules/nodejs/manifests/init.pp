class nodejs {
  case $::osfamily {
    archlinux: {
      package { 'nodejs':
        ensure => present
      }
    }

    debian: {
      package { 'nodejs':
        ensure  => present,
        require => Class['apt::backports']
      }
    }

    redhat: {
      package { 'nodejs':
        ensure  => present,
        require => Class['system::initializers::redhat']
      }
    }

    default: {
      fail('Unrecognized operating system')
    }
  }
}
