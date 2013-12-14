define nginx::vhost(
  $ensure   = undef,
  $vhost    = $fqdn,
  $template = 'vhost-rack'
) {
  $ensure_available = $ensure ? {
    'absent' => 'absent',
    default  => 'file'
  }

  file { "/etc/nginx/sites-available/${vhost}":
    ensure  => $ensure_available,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['nginx'],
    notify  => Service['nginx'],
    content => template("nginx/${template}.conf.erb")
  }

  $ensure_enabled = $ensure ? {
    'absent' => 'absent',
    default  => 'link'
  }

  file { "/etc/nginx/sites-enabled/${vhost}":
    ensure  => $ensure_enabled,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['nginx'],
    notify  => Service['nginx'],
    target  => "/etc/nginx/sites-available/${vhost}"
  }
}
