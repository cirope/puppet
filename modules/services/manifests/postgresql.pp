class postgresql {
  service { 'postgresql':
    enable    => true,
    ensure    => running,
    require   => Package['postgresql']
  }

  file { 'postgresql.conf':
    path    => '/etc/postgresql/9.1/main/postgresql.conf',
    ensure  => file,
    owner   => postgres,
    group   => postgres,
    mode    => 0644,
    content => template('services/postgresql.conf.erb'),
    require => Package['postgresql'],
    notify  => Service['postgresql']
  }
}
