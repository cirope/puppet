class postgresql {
  service { 'postgresql':
    enable  => true,
    ensure  => running,
    require => Package['postgresql']
  }

  file { '/etc/postgresql/9.1/main/postgresql.conf':
    ensure  => file,
    require => Package['postgresql'],
    content => template('services/postgresql.conf.erb')
  }
}
