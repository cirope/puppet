class packages::install::ubuntu {
  package { 'whoopsie':
    ensure => absent
  }

  package { 'curl':
    ensure => present
  }

  package { 'hdparm':
    ensure => present
  }

  package { 'htop':
    ensure => present
  }

  package { 'nmap':
    ensure => present
  }

  package { 'ntp':
    ensure => present
  }

  package { 'tmux':
    ensure => present
  }

  package { 'unzip':
    ensure => present
  }

  package { 'vim-nox':
    ensure => present
  }

  package { 'wget':
    ensure => present
  }

  package { 'zsh':
    ensure => present
  }
}
