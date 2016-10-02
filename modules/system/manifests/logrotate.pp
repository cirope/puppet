class system::logrotate {
  file { "/etc/logrotate.d/${hostname}":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => inline_template('system/logrotate.erb')
  }
}
