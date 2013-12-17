class nginx::install::centos {
  yumrepo { 'nginx':
    name     => 'nginx',
    baseurl  => 'http://nginx.org/packages/centos/$releasever/$basearch/',
    gpgcheck => '0',
    enabled  => '1'
  }

  package { 'nginx':
    ensure  => present,
    require => Yumrepo['nginx']
  }
}
