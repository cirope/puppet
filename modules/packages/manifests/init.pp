class packages($extra = {}) {
  case $::osfamily {
    redhat: { include packages::install::centos }
    debian: { include packages::install::ubuntu }
    default: { fail('Unrecognized operating system') }
  }

  $defaults = {
    ensure => present
  }

  create_resources('package', $extra[$::osfamily], $defaults)
}
