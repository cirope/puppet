class nginx($server = undef) {
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

  if $server {
    $template = $virtual ? {
      virtualbox => $server,
      default    => "${server}ssl"
    }

    file { "/etc/nginx/sites-available/$fqdn":
      ensure  => file,
      owner   => root,
      group   => root,
      mode    => 0644,
      require => Package['nginx'],
      notify  => Service['nginx'],
      content => template("nginx/$template.conf.erb")
    }

    file { "/etc/nginx/sites-enabled/$fqdn":
      ensure  => link,
      owner   => root,
      group   => root,
      mode    => 0644,
      require => File["/etc/nginx/sites-available/$fqdn"],
      notify  => Service['nginx'],
      target  => "/etc/nginx/sites-available/$fqdn"
    }

    file { '/etc/nginx/sites-available/default':
      ensure  => absent,
      require => Package['nginx']
    }

    file { '/etc/nginx/sites-enabled/default':
      ensure  => absent,
      require => Package['nginx']
    }
  }
}
