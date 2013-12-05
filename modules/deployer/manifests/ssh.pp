class deployer::ssh($keys = $::ssh::keys) {
  create_resources('ssh::my_ssh_auth_key', hiera('ssh_keys'), { user => deployer })
}
