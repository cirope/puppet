class packages::install {
  case $::osfamily {
    redhat:  { include packages::install::centos }
    debian:  { include packages::install::ubuntu }
    default: { fail('Unrecognized operating system') }
  }
}
