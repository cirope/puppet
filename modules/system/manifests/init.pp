class system {
  include system::locales
  include system::timezone

  if tagged('server::app') {
    include system::environment
    include system::logrotate
  }

  if tagged('server::db') {
    include system::sysctl
  }
}
