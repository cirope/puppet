class oracle::server::install(
  $user          = 'oracle',
  $group         = 'dba',
  $group_install = 'oinstall',
  $group_oper    = 'oper',
  $type          = 'SE',
  $download      = '/install'
){
  $base_path = '/etc/puppet/packages'

  # this will look for /install/oracle/database/runInstaller
  oradb::installdb { '11.2.0.4_Linux-x86-64':
    version       => '11.2.0.4',
    file          => 'oracle',
    databaseType  => $type,
    oracleBase    => $oracle::server::base,
    oracleHome    => $oracle::server::home,
    bashProfile   => true,
    user          => $user,
    group         => $group,
    group_install => $group_install,
    group_oper    => $group_oper,
    downloadDir   => $download,
    zipExtract    => false,
    require       => [
      User['oracle'],
      File["${download}/db_install.rsp"],
      Package[$oracle::server::dependencies::packages]
    ]
  }
}
