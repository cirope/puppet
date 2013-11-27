class nginx($server = $hostname) {
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

  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 0644,
    require => Package['nginx'],
    notify  => Service['nginx'],
    content => template('nginx/nginx.conf.erb')
  }

  file { "/etc/nginx/sites-available/$server":
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 0644,
    require => Package['nginx'],
    notify  => Service['nginx'],
    content => template("nginx/$server.conf.erb")
  }

  file { "/etc/nginx/sites-enable/$server":
    ensure  => link,
    owner   => root,
    group   => root,
    mode    => 0644,
    require => File["/etc/nginx/sites-available/$server"],
    notify  => Service['nginx'],
    target  => "/etc/nginx/sites-available/$server"
  }

  file { '/etc/nginx/sites-available/default':
    ensure  => absent,
    require => Package['nginx']
  }

  file { '/etc/nginx/sites-enable/default':
    ensure  => absent,
    require => Package['nginx']
  }
}
