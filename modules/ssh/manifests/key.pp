define ssh::key(
  $name,
  $key,
  $ensure  = present,
  $type    = 'rsa',
  $user    = $name,
  $options = []
) {
  ssh_authorized_key {
    "${name}_${user}":
      ensure  => $ensure,
      name    => $name,
      type    => $type,
      user    => $user,
      options => $options,
  }
}
