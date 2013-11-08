class unicorn {
  file { '/etc/init.d/unicorn':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 0755,
    content => template('unicorn/init.sh.erb')
  }
}
