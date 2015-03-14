class oracle::server {
  include oracle::server::user
  include oracle::server::dependencies

  oradb::installdb { '11.2.0.4_Linux-x86-64':
    version                => '11.2.0.4',
    file                   => 'linux.x64_11gR2_database',
    databaseType           => 'EE',
    oracleBase             => '/oracle',
    oracleHome             => '/oracle/product/12.1/db',
    bashProfile            => true,
    user                   => 'oracle',
    group                  => 'dba',
    group_install          => 'oinstall',
    group_oper             => 'oper',
    downloadDir            => '/data/install',
    zipExtract             => true,
    puppetDownloadMntPoint => '/oracle/db',
    require                => [
      User['oracle'],
      Package[$oracle::server::dependencies::packages]
    ]
  }
}
