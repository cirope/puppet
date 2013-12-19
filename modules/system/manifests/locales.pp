class system::locales {
  case $::osfamily {
    redhat:    { include system::locales::centos }
    debian:    { include system::locales::ubuntu }
    archlinux: { include system::locales::archlinux }
    default:   { fail('Unrecognized operating system for nginx') }
  }
}
