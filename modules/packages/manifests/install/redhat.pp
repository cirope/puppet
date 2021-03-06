class packages::install::redhat {
  package { 'bzip2':
    ensure => present
  }

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
    ensure  => present,
    require => Class['system::initializers::redhat']
  }

  package { 'libffi-devel':
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

  package { 'vim-enhanced':
    ensure => present
  }

  package { 'wget':
    ensure => present
  }

  package { 'zsh':
    ensure => present
  }
}
