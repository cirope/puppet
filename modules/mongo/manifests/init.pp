class mongo(
  $database = $hostname,
  $user     = $hostname,
  $password = $hostname
) {
  class { 'mongodb::globals':
    manage_package_repo => true
  }

  class { 'mongodb::server':
    require => Class['mongodb::globals']
  }

  class { 'mongodb::client':
    require => Class['mongodb::server']
  }

  mongodb_user { $user:
    ensure        => present,
    password_hash => md5("${user}:mongo:${password}"),
    database      => $database,
    roles         => ['readWrite', 'dbAdmin'],
    require       => Class['mongodb::server']
  }
}
