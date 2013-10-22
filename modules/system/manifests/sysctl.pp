class sysctl {
  file { '/etc/sysctl.conf':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 0644,
    content => template('system/sysctl.conf.erb')
  }
}
