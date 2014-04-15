class nginx::install::debian {
  $distro = downcase($::operatingsystem)

  apt::source { 'nginx':
    location   => "http://nginx.org/packages/${distro}",
    repos      => 'nginx',
    key        => '7BD9BF62',
    key_source => 'http://nginx.org/keys/nginx_signing.key'
  }

  package { 'nginx':
    ensure  => present,
    require => Apt::Source['nginx']
  }
}
