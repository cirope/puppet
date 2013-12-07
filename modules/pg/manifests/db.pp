class pg::db(
  $name = "${hostname}_production",
  $user = $hostname,
  $password = $hostname
) {
  postgresql::server::db { $name:
    user     => $user,
    password => postgresql_password($user, $password)
  }
}
