class system::locales {
  case $::osfamily {
    redhat: { include system::locales::centos }
    debian: { include system::locales::ubuntu }
    default: { fail('Unrecognized operating system for nginx') }
  }
}
