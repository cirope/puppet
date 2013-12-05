class ssh($keys = []) {
  define ssh::my_ssh_auth_keys(
    $name,
    $key,
    $ensure  = present,
    $type    = 'rsa',
    $user    = $name,
    $options = []
  ) {
    ssh_authorized_key {
      $name:
        ensure  => $ensure,
        name    => $name,
        type    => $type,
        user    => $user,
        options => $options,
    }
  }

  $defaults = {
    user => root
  }

  create_resources('ssh::my_ssh_auth_key', $keys, $defaults)
}
