class unicorn {
  $service_file = $::osfamily ? {
    archlinux => '/etc/systemd/system/unicorn.service',
    default   => '/etc/init.d/unicorn'
  }
  $template = $::osfamily ? {
    archlinux => 'unicorn/unicorn.service.erb',
    default   => 'unicorn/init.sh.erb'
  }

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
