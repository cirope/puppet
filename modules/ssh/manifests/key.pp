define ssh::key(
  $key,
  $ensure  = present,
  $type    = 'rsa',
  $user    = $name,
  $options = []
) {
  ssh_authorized_key { $name:
    ensure  => $ensure,
    name    => $name,
    key     => $key,
    type    => $type,
    user    => $user,
    options => $options,
  }
}
