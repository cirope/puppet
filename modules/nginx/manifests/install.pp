class nginx::install {
  case $::osfamily {
    redhat:    { include nginx::install::centos }
    debian:    { include nginx::install::ubuntu }
    archlinux: { include nginx::install::archlinux }
    default:   { fail('Unrecognized operating system for nginx') }
  }
}
