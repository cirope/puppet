class system::locales {
  case $::operatingsystem {
    archlinux:      { include system::locales::archlinux }
    redhat, centos: { include system::locales::redhat }
    debian:         { include system::locales::debian }
    ubuntu:         { include system::locales::ubuntu }
    default:        { fail('Unrecognized operating system for locales') }
  }
}
