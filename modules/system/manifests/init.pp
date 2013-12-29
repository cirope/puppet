class system {
  case $::osfamily {
    debian: { include system::initializers::debian }
  }

  include system::locales
  include system::timezone
}
