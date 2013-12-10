define pg::db(
  $database = "${hostname}_production",
  $user = $hostname,
  $password = $hostname
) {
  postgresql::server::db { $database:
    user     => $user,
    password => postgresql_password($user, $password),
    require  => Class['postgresql::server']
  }
}
