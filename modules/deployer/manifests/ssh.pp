class deployer::ssh($keys = $::ssh::keys) {
  $defaults = {
    user => deployer
  }

  if $keys {
    create_resources('ssh::key', $keys, $defaults)
  }
}
