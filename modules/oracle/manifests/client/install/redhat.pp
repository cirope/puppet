class oracle::client::install::redhat {
  # https://github.com/kubo/ruby-oci8/blob/master/docs/install-instant-client.md

  $base_path           = '/etc/puppet/packages'
  $basic_client_path   = "${base_path}/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm"
  $devel_client_path   = "${base_path}/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm"
  $sqlplus_client_path = "${base_path}/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm"

  file { $basic_client_path:
    ensure => present
  }

  file { $devel_client_path:
    ensure => present
  }

  file { $sqlplus_client_path:
    ensure => present
  }

  package { 'libaio':
    ensure => present
  }

  package { 'oracle-instantclient12.1-basic':
    provider => 'rpm',
    ensure   => present,
    source   => $basic_client_path,
    require  => [File[$basic_client_path], Package['libaio']]
  }

  package { 'oracle-instantclient12.1-devel':
    provider => 'rpm',
    ensure   => present,
    source   => $devel_client_path,
    require  => [File[$devel_client_path], Package['oracle-instantclient12.1-basic']]
  }

  package { 'oracle-instantclient12.1-sqlplus':
    provider => 'rpm',
    ensure   => present,
    source   => $sqlplus_client_path,
    require  => [File[$sqlplus_client_path], Package['oracle-instantclient12.1-basic']]
  }
}