class system::locales {
  case $operatingsystem {
    centos, redhat: { include system::locales::centos }
    debian, ubuntu: { include system::locales::ubuntu }
    default: { fail('Unrecognized operating system for nginx') }
  }
}
