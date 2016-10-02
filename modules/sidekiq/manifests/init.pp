class sidekiq {
  $service_dir  = $::osfamily ? {
    redhat  => '/usr/lib/systemd/system',
    default => '/lib/systemd/system'
  }

  $service_file = "${service_dir}/sidekiq.service"
  $template     = 'sidekiq/sidekiq.service.erb'

  service { 'sidekiq':
    enable  => true,
    require => File[$service_file]
  }

  file { $service_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['sidekiq'],
    content => inline_template($template)
  }
}
