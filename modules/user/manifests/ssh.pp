define user::ssh($user, $keys = undef) {
  $defaults = {
    user => $user
  }

  if $keys {
    create_resources('ssh::key', prefix_hash_keys($keys, "${user}_"), $defaults)
  }
}
