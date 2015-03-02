class oracle::install::debian {
  # https://github.com/kubo/ruby-oci8/blob/master/docs/install-instant-client.md

  $base_path           = '/etc/puppet/packages'
  $basic_client_path   = "${base_path}/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64"
  $devel_client_path   = "${base_path}/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64"
  $sqlplus_client_path = "${base_path}/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64"

  exec { 'alien':
    command => "alien -i ${basic_client_path}.rpm; alien -i ${devel_client_path}.rpm; alien -i ${sqlplus_client_path}.rpm",
    creates => "${basic_client_path}.deb",
    require => Package['alien']
  }

  package { 'alien':
    ensure => present
  }

  package { 'libaio1':
    ensure => present
  }

  package { 'oracle-instantclient12.1-basic':
    provider => 'dpkg',
    ensure   => present,
    source   => "${basic_client_path}.deb",
    require  => [Exec['alien'], Package['libaio1']]
  }

  package { 'oracle-instantclient12.1-devel':
    provider => 'dpkg',
    ensure   => present,
    source   => "${devel_client_path}.deb",
    require  => [Exec['alien'], Package['oracle-instantclient12.1-basic']]
  }

  package { 'oracle-instantclient12.1-sqlplus':
    provider => 'dpkg',
    ensure   => present,
    source   => "${sqlplus_client_path}.deb",
    require  => [Exec['alien'], Package['oracle-instantclient12.1-basic']]
  }
}
