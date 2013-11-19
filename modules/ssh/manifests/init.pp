class ssh($keys = []) {
  define user_key($name, $value) {
    ssh_authorized_key { "${name}_root":
      ensure => present,
      key    => $value,
      type   => rsa,
      user   => root
    }

    ssh_authorized_key { "${name}_$deployer::user":
      ensure  => present,
      key     => $value,
      type    => rsa,
      user    => $deployer::user,
      require => User[$deployer::user]
    }
  }

  user_key { $keys: }
}
