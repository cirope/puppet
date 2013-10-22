class system {
  file { '/etc/sysctl.conf':
    ensure  => file,
    content => template('system/sysctl.conf.erb')
  }
}
