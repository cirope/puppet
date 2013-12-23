class packages::install::archlinux {
  package { 'curl':
    ensure => present
  }

  package { 'git':
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

  package { 'gvim':
    ensure => present
  }

  package { 'wget':
    ensure => present
  }

  package { 'zsh':
    ensure => present
  }
}