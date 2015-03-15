class oracle::server::install {
  # this will look for /install/oracle/database/runInstaller
  oradb::installdb { "${oracle::server::version}_Linux-x86-64":
    version       => $oracle::server::version,
    file          => 'oracle',
    databaseType  => $oracle::server::type,
    oracleBase    => $oracle::server::base,
    oracleHome    => $oracle::server::home,
    bashProfile   => true,
    user          => $oracle::server::user,
    group         => $oracle::server::group,
    group_install => $oracle::server::group_install,
    group_oper    => $oracle::server::group_oper,
    downloadDir   => $oracle::server::download,
    zipExtract    => false,
    require       => [
      User['oracle'],
      File["${oracle::server::download}/db_install.rsp"],
      Package[$oracle::server::dependencies::packages]
    ]
  }
}
