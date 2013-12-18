class packages($extra = {}) {
  include packages::install

  $defaults = {
    ensure => present
  }

  create_resources('package', $extra[$::osfamily], $defaults)
}
