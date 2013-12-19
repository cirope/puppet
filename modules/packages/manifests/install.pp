class packages::install {
  case $::osfamily {
    redhat:    { include packages::install::centos }
    debian:    { include packages::install::ubuntu }
    archlinux: { include packages::install::archlinux }
    default:   { fail('Unrecognized operating system') }
  }
}
