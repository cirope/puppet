class system::locales {
  case $::osfamily {
    archlinux: { include system::locales::archlinux }
    debian:    { include system::locales::debian }
    redhat:    { include system::locales::redhat }
    default:   { fail('Unrecognized operating system for nginx') }
  }
}
