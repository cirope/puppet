class oracle {
  oradb::client { '12.1.0.2.0_Linux-x86-64':
    version                => '12.1.0.2.0',
    file                   => 'linuxamd64_12c_client.zip',
    oracleBase             => '/oracle',
    oracleHome             => '/oracle/product/12.1/client',
    user                   => 'oracle',
    group                  => 'dba',
    group_install          => 'oinstall',
    downloadDir            => '/install',
    remoteFile             => true,
    puppetDownloadMntPoint => 'puppet:///modules/oradb/',
    logoutput              => true
  }
}
