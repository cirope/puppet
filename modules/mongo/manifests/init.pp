class mongo(
  $database = $hostname,
  $user     = $hostname,
  $password = $hostname
) {
  class { '::mongodb::globals':
    manage_package_repo => true
  }

  class { '::mongodb::server':
    auth    => true,
    require => Class['::mongodb::globals']
  }

  class { '::mongodb::client':
    require => Class['::mongodb::server']
  }

  mongodb::db { $database:
    user          => $user,
    password_hash => md5("${user}:mongo:${password}")
  }
}
