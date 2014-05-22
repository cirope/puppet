class system::sysctl {
  $local_conf = '/etc/sysctl.d/99-local.conf'

  file { $local_conf:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('system/sysctl.local.conf.erb')
  }

  exec { 'sysctl':
    command     => 'sysctl --system',
    refreshonly => true,
    subscribe   => File[$local_conf]
  }
}
