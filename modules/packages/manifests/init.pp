class packages {
  package { 'build-essential':
    ensure => present
  }

  package { 'git-core':
    ensure => present
  }

  package { 'htop':
    ensure => present
  }

  package { 'ntp':
    ensure => present
  }

  package { 'postgresql':
    ensure => present
  }

  package { 'zsh':
    ensure => present
  }
}
