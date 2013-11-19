class packages($required = []) {
  $defaults = {
    ensure => present
  }

  create_resources(package, $required, $defaults)
}
