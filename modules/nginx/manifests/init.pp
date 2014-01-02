class nginx($server = undef) {
  include nginx::install
  include nginx::config

  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx']
  }
}
