class ssh($keys = undef) {
  $defaults = {
    user => root
  }

  if $keys {
    create_resources('ssh::key', $keys, $defaults)
  }
}
