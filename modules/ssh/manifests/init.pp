class ssh($keys = []) {
  define my_ssh_auth_keys(
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

  create_resources('my_ssh_auth_key', hiera('ssh_keys'), { user => root })
}
