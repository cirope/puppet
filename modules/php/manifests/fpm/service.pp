class php::fpm::service {
  service { 'php5-fpm':
    ensure  => running,
    enable  => true,
    require => Package['php5-fpm']
  }
}
