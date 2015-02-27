class nginx::install::redhat {
  $os = $operatingsystem ? {
    centos  => 'centos',
    redhat  => 'rhel',
    default => undef
  }

  yumrepo { 'nginx':
    name     => 'nginx',
    baseurl  => "http://nginx.org/packages/${os}/\$releasever/\$basearch/",
    gpgcheck => '0',
    enabled  => '1'
  }

  package { 'nginx':
    ensure  => present,
    require => Yumrepo['nginx']
  }
}
