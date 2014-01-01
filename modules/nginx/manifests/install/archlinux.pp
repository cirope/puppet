class nginx::install::archlinux {
  package { 'nginx':
    ensure => 'present' # Due to some odd bug in puppet this must be quoted
  }
}
