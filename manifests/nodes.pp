node 'mawidabp.com', 'mawidabp-dev.com' inherits basenode {
  include deployer
  include postgresql_conf
  include unicorn
}

node 'mawidaqa.com', 'mawidaqa-dev.com' inherits basenode {
  include deployer
  include postgresql_conf
  include unicorn
}

node 'cirope.com', 'cirope-dev.com' inherits basenode {
  include deployer
  include unicorn
}
