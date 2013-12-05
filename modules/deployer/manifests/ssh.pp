class deployer::ssh($keys = $::ssh::keys) {
  $defaults = {
    user => deployer
  }

  create_resources('ssh::my_ssh_auth_key', $keys, $defaults)
}
