class packages($extra = {}) {
  case $operatingsystem {
    centos, redhat: { include packages::install::centos }
    debian, ubuntu: { include packages::install::ubuntu }
    default: { fail('Unrecognized operating system') }
  }

  $defaults = {
    ensure => present
  }

  create_resources('package', $extra[$::osfamily], $defaults)
}
