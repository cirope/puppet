class oracle::server::config {
  file { "${oracle::server::download}/db_install_${oracle::server::version}.rsp":
    ensure  => present,
    content => template('oracle/db_install.rsp.erb'),
    mode    => '0775',
    owner   => $oracle::server::user,
    group   => $oracle::server::group,
    require => User[$oracle::server::user]
  }
}
