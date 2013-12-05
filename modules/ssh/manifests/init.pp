class ssh($keys = undef) {
  include ssh::auth_keys

  $defaults = {
    user => root
  }

  if $keys {
    create_resources('ssh::auth_key', $keys, $defaults)
  }
}
