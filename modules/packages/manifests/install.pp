class packages::install {
  case $::osfamily {
    archlinux: { include packages::install::archlinux }
    debian:    { include packages::install::debian }
    redhat:    { include packages::install::redhat }
    default:   { fail('Unrecognized operating system') }
  }
}
