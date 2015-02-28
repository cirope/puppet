class oracle {
  case $::osfamily {
    redhat:    { include oracle::install::redhat }
    default:   { fail('Unrecognized operating system for Oracle') }
  }
}
