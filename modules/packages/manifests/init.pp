class packages($required = [], $extra = []) {
  package { 'whoopsie':
    ensure => purged
  }

  $defaults = {
    ensure => present
  }

  create_resources('package', $required, $defaults)
  create_resources('package', $extra, $defaults)
}
