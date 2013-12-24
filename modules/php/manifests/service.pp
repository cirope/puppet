class php::service {
  service { 'php5-fpm':
    ensure => running,
    require => Package['php5-fpm']
  }
}
