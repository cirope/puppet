class packages {
  package { 'build-essential':
    ensure => present
  }

  package { 'htop':
    ensure => present
  }

  package { 'libreadline-dev':
    ensure => present
  }

  package { 'ntp':
    ensure => present
  }

  package { 'postgresql':
    ensure  => present,
    require => Exec['root-profile-refresh']
  }

  package { 'screen':
    ensure => present
  }

  package { 'vim-nox':
    ensure => present
  }

  package { 'zsh':
    ensure => present
  }
}
