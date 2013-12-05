class ssh($keys = []) {
  define root_key() {
    ssh_authorized_key { "${name}_root":
      ensure => present,
      key    => $name,
      type   => rsa,
      user   => root
    }
  }

  root_key { $keys: }
}
