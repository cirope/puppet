define user::ssh($user) {
  $keys = hiera('user::ssh::keys', undef)
  $defaults = {
    user => $user
  }

  if $keys {
    create_resources(
      'user::ssh::key', prefix_hash_keys($keys, "${user}_"), $defaults
    )
  }
}
