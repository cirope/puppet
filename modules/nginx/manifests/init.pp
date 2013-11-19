class nginx {
  class { 'apt': }

  apt::ppa { 'ppa:nginx/stable': }

  package { 'nginx':
    ensure  => present,
    require => Apt::Ppa['ppa:nginx/stable']
  }

  service { 'nginx':
    enable  => true,
    ensure  => running,
    require => Package['nginx']
  }

  $template = $virtual ? {
    virtualbox => 'nginx_http.conf.erb',
    default    => 'nginx_https.conf.erb'
  }

  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 0644,
    require => Package['nginx'],
    notify  => Service['nginx'],
    content => template("nginx/$template")
  }
}
