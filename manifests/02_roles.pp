class role::web {
  include ::nginx
}

class role::app {
  include ::system::environment
  include ::system::logrotate
  include ::user::deployer
  include ::nginx
  include ::unicorn
  include ::nodejs
  include ::redis
  include ::newrelic
}

class role::db {
  include ::system::sysctl
  include ::pg
}

class role::all {
  include ::role::web
  include ::role::app
  include ::role::db
}
