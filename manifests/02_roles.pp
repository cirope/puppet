class role::web {
  include ::nginx
}

class role::app {
  include ::system::environment
  include ::system::logrotate
  include ::user::deployer
  include ::nodejs
}

class role::db {
  include ::system::sysctl
  include ::mongo
}

class role::all {
  include ::role::web
  include ::role::app
  include ::role::db
}
