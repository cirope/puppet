class deployer::ssh($keys = $::ssh::keys) {
  $defaults = {
    user => deployer
  }

  if $keys {
    create_resources('ssh::auth_key', $keys, $defaults)
  }
}
