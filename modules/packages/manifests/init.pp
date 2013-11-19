class packages($required = [], $extra = []) {
  $defaults = {
    ensure => present
  }

  create_resources(package, $required, $defaults)
  create_resources(package, $extra, $defaults)
}
