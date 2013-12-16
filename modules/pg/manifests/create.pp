class pg::create($databases = undef) {
  if $databases {
    $create = $databases
  }
  else {
    $defaults = {
      database => "${hostname}_production",
      user     => $hostname,
      password => $hostname
    }

    $create = {
      defaultdb => $defaults
    }
  }

  create_resources('pg::db', $create)
}
