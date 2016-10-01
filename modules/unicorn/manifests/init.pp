class unicorn {
  $service_file = '/lib/systemd/system/unicorn.service'
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
