class oracle::server::db(
  $database = "${hostname}_production",
  $user     = $hostname,
  $password = $hostname
) {
  oradb::database{ $database:
    oracleBase              => $oracle::server::base,
    oracleHome              => $oracle::server::home,
    version                 => '11.2',
    user                    => 'oracle',
    group                   => 'dba',
    downloadDir             => $oracle::server::download,
    action                  => 'create',
    dbName                  => $database,
    dbDomain                => $hostname,
    dbPort                  => '1521',
    sysPassword             => $password,
    systemPassword          => $password,
    dataFileDestination     => '/oracle/oradata',
    recoveryAreaDestination => '/oracle/flash_recovery_area',
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
    require                 => db_listener['listener']
  }
}
