class nginx::install {
  case $::osfamily {
    archlinux: { include nginx::install::archlinux }
    debian:    { include nginx::install::debian }
    redhat:    { include nginx::install::redhat }
    default:   { fail('Unrecognized operating system for nginx') }
  }
}
