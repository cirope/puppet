class sidekiq {
  $service_file  = '/etc/init.d/sidekiq'
  $template      = 'sidekiq/init.sh.erb'

  service { 'sidekiq':
    enable  => true,
    require => [File[$service_file], Service[$redis::service]]
  }

  file { $service_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    notify  => Service['sidekiq'],
    content => template($template)
  }
}
