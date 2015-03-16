class oracle::server::db(
  $database = $hostname,
  $user     = $hostname,
  $password = $hostname
) {
  oradb::database { $database:
    oracleBase              => $oracle::server::base,
    oracleHome              => $oracle::server::home,
    version                 => '11.2',
    user                    => $oracle::server::user,
    group                   => $oracle::server::group,
    downloadDir             => $oracle::server::download,
    action                  => 'create',
    dbName                  => $database,
    dbPort                  => '1521',
    sysPassword             => $password,
    systemPassword          => $password,
    dataFileDestination     => "${oracle::server::base}/oradata",
    recoveryAreaDestination => "${oracle::server::base}/flash_recovery_area",
    characterSet            => 'AL32UTF8',
    nationalCharacterSet    => 'UTF8',
    initParams              => {
      'open_cursors'        => '1000',
      'processes'           => '600',
      'job_queue_processes' => '4'
    },
    sampleSchema            => 'TRUE',
    memoryPercentage        => '40',
    memoryTotal             => '800',
    databaseType            => 'MULTIPURPOSE',
    emConfiguration         => 'NONE',
    require                 => Db_listener['listener']
  }

  oradb::autostartdatabase { $database:
    oracleHome => $oracle::server::home,
    user       => $oracle::server::user,
    dbName     => $database,
    require    => Oradb::Database[$database]
  }
}
