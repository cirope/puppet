class ssh($keys = undef) {
  $defaults = {
    user => root
  }

  if $keys {
    create_resources('ssh::key', prefix_hash_keys($keys, 'root_'), $defaults)
  }
}
