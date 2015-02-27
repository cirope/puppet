class system {
  case $::osfamily {
    debian:  { include system::initializers::debian }
    redhat:  { include system::initializers::redhat }
    default: { }
  }

  include system::locales
  include system::timezone
}
