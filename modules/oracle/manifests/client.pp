class oracle::client {
  case $::osfamily {
    debian:  { include oracle::client::install::debian }
    redhat:  { include oracle::client::install::redhat }
    default: { fail('Unrecognized operating system for Oracle') }
  }
}
