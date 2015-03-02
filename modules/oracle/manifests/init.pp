class oracle {
  case $::osfamily {
    debian:  { include oracle::install::debian }
    redhat:  { include oracle::install::redhat }
    default: { fail('Unrecognized operating system for Oracle') }
  }
}
