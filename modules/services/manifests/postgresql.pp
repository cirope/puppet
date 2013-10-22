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

  file { 'pg_hba.conf':
    path    => '/etc/postgresql/9.1/main/pg_hba.conf',
    ensure  => file,
    owner   => postgres,
    group   => postgres,
    mode    => 0640,
    source  => 'puppet:///modules/services/pg_hba.conf',
    require => Package['postgresql'],
    notify  => Service['postgresql']
  }
}
