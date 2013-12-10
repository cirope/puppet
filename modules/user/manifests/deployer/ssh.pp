class user::deployer::ssh($keys = $::ssh::keys) {
  $defaults = {
    user => 'deployer'
  }

  if $keys {
    create_resources('ssh::key', prefix_hash_keys($keys, 'deployer_'), $defaults)
  }
}
