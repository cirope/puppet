class oracle::client::install::debian {
  # https://github.com/kubo/ruby-oci8/blob/master/docs/install-instant-client.md

  $base_path           = '/etc/puppet/packages'
  $basic_client_path   = "${base_path}/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64"
  $devel_client_path   = "${base_path}/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64"
  $sqlplus_client_path = "${base_path}/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64"

  package { 'alien':
    ensure => present
  }

  package { 'libaio1':
    ensure => present
  }

  exec { 'alien':
    command => "alien -i ${basic_client_path}.rpm; alien -i ${devel_client_path}.rpm; alien -i ${sqlplus_client_path}.rpm",
    unless  => 'dpkg -s oracle-instantclient12.1-basic',
    require => [Package['alien'], Package['libaio1']]
  }
}
