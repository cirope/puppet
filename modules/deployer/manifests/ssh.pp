class ssh($keys = $::ssh::keys) {
  define deployer_key() {
    ssh_authorized_key { "${name}_$deployer::user":
      ensure  => present,
      key     => $name,
      type    => rsa,
      user    => $deployer::user,
      require => User[$deployer::user]
    }
  }

  deployer_key { $keys: }
}
