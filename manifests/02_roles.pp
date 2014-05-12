class role::web {
  include ::nginx
}

class role::app {
  include ::system::environment
  include ::system::logrotate
  include ::user::deployer
  include ::unicorn
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

class role::php {
  include ::role::web
  include ::role::db
  include ::php::fpm
}

class role::owncloud {
  include ::role::php
  include ::php::owncloud
}
