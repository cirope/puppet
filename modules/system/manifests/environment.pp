class system::environment {
  file { '/etc/environment':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => inline_template('system/environment.erb')
  }
}
