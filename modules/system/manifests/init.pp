class system {
  case $::osfamily {
    debian:  { include system::initializers::debian }
    default: { }
  }

  include system::locales
  include system::timezone
}
