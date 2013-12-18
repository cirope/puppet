include vars

class baseclass {
  include $::osfamily

  include system
  include swap
  include packages
  include services
  include user
}

class server::web {
  include nginx
}

class server::app {
  include user::deployer
  include unicorn
  include newrelic
}

class server::db {
  include pg
}

class server::all {
  include server::web
  include server::app
  include server::db
}

class server::php {
  include php
}
