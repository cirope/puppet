class nginx::install::archlinux {
  package { 'nginx':
    ensure => present
  }
}
