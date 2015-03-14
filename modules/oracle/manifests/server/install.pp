class oracle::server::install {
  $base_path = '/etc/puppet/packages'

  # this will look for /install/oracle/database/runInstaller
  oradb::installdb { '11.2.0.4_Linux-x86-64':
    version                => '11.2.0.4',
    file                   => 'oracle',
    databaseType           => 'EE',
    oracleBase             => $oracle::server::base,
    oracleHome             => $oracle::server::home,
    bashProfile            => true,
    user                   => 'oracle',
    group                  => 'dba',
    group_install          => 'oinstall',
    group_oper             => 'oper',
    downloadDir            => '/install',
    zipExtract             => false,
    puppetDownloadMntPoint => $base_path,
    require                => [
      User['oracle'],
      Package[$oracle::server::dependencies::packages]
    ]
  }
}
