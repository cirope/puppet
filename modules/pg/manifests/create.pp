class pg::create($databases = undef) {
  $defaults = {
    database => "${hostname}_production",
    user => $hostname,
    password => $hostname
  }

  create_resources('pg::db', $databases, $defaults)
}
