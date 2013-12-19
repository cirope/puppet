class packages($extra = undef) {
  include packages::install

  $defaults = {
    ensure => present
  }

  if $extra {
    create_resources('package', $extra[$::osfamily], $defaults)
  }
}
