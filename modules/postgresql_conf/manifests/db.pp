class db {
  $user     = $hostname
  $password = $hostname
  $db       = "${hostname}_production"

  postgresql::server::db { $db:
    user     => $user,
    password => postgresql_password($user, $password)
  }
}
