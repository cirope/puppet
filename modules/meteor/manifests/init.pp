class meteor {
  include nodejs

  $service_file = '/etc/init.d/meteor'

  package { 'forever':
    ensure   => present,
    provider => 'npm'
  }

  service { 'meteor':
    enable  => true,
    require => [Package['forever'], File[$service_file]]
  }

  file { $service_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    notify  => Service['meteor'],
    require => Class['mongo'],
    content => template('meteor/init.sh.erb')
  }
}
