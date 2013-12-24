class baseclass {
  include $::osfamily,
    vars,
    system,
    swap,
    packages,
    services,
    user
}

class role::web {
  include nginx
}

class role::app {
  include system::environment
  include system::logrotate
  include user::deployer
  include unicorn
  include newrelic
}

class role::db {
  include system::sysctl
  include pg
}

class role::all {
  include role::web
  include role::app
  include role::db
}

class role::php {
  include role::web
  include role::db
  include php
  include pear_conf
}
