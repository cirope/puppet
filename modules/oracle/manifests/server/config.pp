class oracle::server::config {
  file { "${oracle::server::install::download}/db_install_${oracle::server::install::version}.rsp":
    ensure  => present,
    content => template('oracle/db_install.rsp.erb'),
    mode    => '0775',
    owner   => $oracle::server::install::user,
    group   => $oracle::server::install::group,
    require => User[$oracle::server::install::user]
  }
}
