class newrelic::install {
  case $::osfamily {
    redhat: { include newrelic::install::centos }
    debian: { include newrelic::install::ubuntu }
    default: { fail('Unrecognized operating system for newrelic') }
  }
}
