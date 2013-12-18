class nginx($server = undef) {
  include nginx::install

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

  file { '/etc/nginx/sites-available':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['nginx']
  }

  file { '/etc/nginx/sites-enabled':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['nginx']
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
