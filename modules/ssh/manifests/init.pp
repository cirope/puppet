class ssh($keys = []) {
  define user_key() {
    ssh_authorized_key { "${name}_root":
      ensure => present,
      key    => $name,
      type   => rsa,
      user   => root
    }

    if defined('deployer::user') {
      ssh_authorized_key { "${name}_$deployer::user":
        ensure  => present,
        key     => $name,
        type    => rsa,
        user    => $deployer::user,
        require => User[$deployer::user]
      }
    }
  }

  user_key { $keys: }
}
