class redis {
  case $::osfamily {
    archlinux: { include redis::install::archlinux }
    debian:    { include redis::install::debian }
    redhat:    { include redis::install::redhat }
    default:   { fail('Unrecognized operating system') }
  }
}
