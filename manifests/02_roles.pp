class role::web {
  include ::nginx
}

class role::app {
  include ::system::environment
  include ::system::logrotate
  include ::nodejs
}

class role::db {
  include ::system::sysctl
}

class role::all {
  include ::role::web
  include ::role::app
  include ::role::db
}
