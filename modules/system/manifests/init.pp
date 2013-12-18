class system {
  include system::locales
  include system::timezone

  if defined(Class['server::app']) {
    include system::environment
    include system::logrotate
  }

  if defined(Class['server::db']) {
    include system::sysctl
  }
}
