class newrelic::install {
  case $::osfamily {
    archlinux: { include newrelic::install::archlinux }
    debian:    { include newrelic::install::debian }
    redhat:    { include newrelic::install::redhat }
    default:   { fail('Unrecognized operating system for newrelic') }
  }
}
