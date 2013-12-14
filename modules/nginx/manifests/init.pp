class nginx($server = undef) {
  apt::ppa { 'ppa:nginx/stable': }

  package { 'nginx':
    ensure  => present,
    require => Apt::Ppa['ppa:nginx/stable']
  }

  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx']
  }

  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['nginx'],
    notify  => Service['nginx'],
    content => template('nginx/nginx.conf.erb')
  }

  if $server {
    $template = $virtual ? {
      virtualbox => $server,
      default    => "${server}ssl"
    }

    nginx::vhost { $fqdn:
      template => $template
    }

    nginx::vhost { 'default':
      vhost  => 'default',
      ensure => absent
    }
  }
}
