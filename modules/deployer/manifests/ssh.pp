class deployer::ssh($keys = $::ssh::keys) {
  create_resources('ssh::my_ssh_auth_key', $keys, { user => deployer })
}
