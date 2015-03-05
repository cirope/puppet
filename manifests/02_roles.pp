class role::web {
  include ::nginx
}

class role::db {
  include ::system::sysctl
  include ::pg
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
