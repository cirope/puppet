class unicorn {
  $service_dir  = $::osfamily ? {
    redhat  => '/usr/lib/systemd/system',
    default => '/lib/systemd/system'
  }

  $service_file = "${service_dir}/unicorn.service"
  $template     = 'unicorn/unicorn.service.erb'

  service { 'unicorn':
    enable  => true,
    require => File[$service_file]
  }

  file { $service_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    notify  => Service['unicorn'],
    content => template($template)
  }
}
