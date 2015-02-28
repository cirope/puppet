class unicorn {
  $service_file = $::osfamily ? {
    archlinux => '/etc/systemd/system/unicorn.service',
    default   => '/etc/init.d/unicorn'
  }
  $template = $::osfamily ? {
    archlinux => 'unicorn/unicorn.service.erb',
    default   => 'unicorn/init.sh.erb'
  }
  $run_directory = '/run/unicorn'

  service { 'unicorn':
    enable  => true,
    require => [File[$service_file], File[$run_directory]]
  }

  file { $run_directory:
    ensure  => directory,
    owner   => $user::deployer::username,
    group   => $user::deployer::group,
    require => User[$user::deployer::username]
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
