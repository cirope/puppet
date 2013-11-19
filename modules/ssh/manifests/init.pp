class ssh($keys = []) {
  $keys.each { |$key, $value|
    ssh_authorized_key { "${key}_root":
      ensure => present,
      key    => $value,
      type   => rsa,
      user   => root
    }

    ssh_authorized_key { "${key}_$deployer::user":
      ensure  => present,
      key     => $value,
      type    => rsa,
      user    => $deployer::user,
      require => User[$deployer::user]
    }
  }
}
