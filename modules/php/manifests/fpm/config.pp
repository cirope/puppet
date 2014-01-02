class php::fpm::config {
  file { '/etc/php5/fpm/php.ini' :
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/php/fpm/php.ini',
    require => Package['php5-fpm'],
    notify  => Service['php5-fpm']
  }
}
