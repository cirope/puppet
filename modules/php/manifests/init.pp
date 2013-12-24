class php {
  include php::install
  include php::service
  include php::pear

  file { '/etc/php5/fpm/php.ini' :
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/php/php.ini',
    require => Package['php5-fpm'],
    notify  => Service['php5-fpm']
  }
}
