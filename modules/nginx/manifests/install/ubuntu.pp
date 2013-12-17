class nginx::install::ubuntu {
  apt::ppa { 'ppa:nginx/stable': }

  package { 'nginx':
    ensure  => present,
    require => Apt::Ppa['ppa:nginx/stable']
  }
}
