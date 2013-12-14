define nginx::vhost(
  $ensure   = undef,
  $vhost    = $fqdn,
  $template = 'vhost-rack'
) {
  if $ensure == 'absent' {
    file { "/etc/nginx/sites-available/${vhost}":
      ensure  => $ensure,
      require => Package['nginx']
    }

    file { "/etc/nginx/sites-enabled/${vhost}":
      ensure  => $ensure,
      require => Package['nginx']
    }
  } else {
    file { "/etc/nginx/sites-available/${vhost}":
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => Package['nginx'],
      notify  => Service['nginx'],
      content => template("nginx/${template}.conf.erb")
    }

    file { "/etc/nginx/sites-enabled/${vhost}":
      ensure  => link,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => Package['nginx'],
      notify  => Service['nginx'],
      target  => "/etc/nginx/sites-available/${vhost}"
    }
  }
}
