class phpfpm {
  include phpfpm::install
  include phpfpm::service
  include phpfpm::pear

  file { '/etc/php5/fpm/php.ini' :
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/phpfpm/php.ini',
    require => Package['php5-fpm'],
    notify  => Service['php5-fpm']
  }
}
