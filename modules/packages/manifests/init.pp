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
