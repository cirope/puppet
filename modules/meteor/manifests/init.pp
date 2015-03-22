class meteor {
  $service_file = '/etc/init.d/meteor'

  package { 'forever':
    ensure => present
  }

  service { 'meteor':
    enable  => true,
    require => File[$service_file]
  }

  file { $service_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    notify  => Service['meteor'],
    content => template('meteor/init.sh.erb')
  }
}
