class unicorn {
  service { 'unicorn':
    enable  => true,
    require => File['/etc/init.d/unicorn']
  }

  file { '/etc/init.d/unicorn':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 0755,
    notify  => Service['unicorn'],
    content => template('unicorn/init.sh.erb')
  }
}
