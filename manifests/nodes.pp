node 'mawidabp.com', 'mawidabp-dev.com' inherits basenode {
  include deployer
  include postgresql_conf
  include unicorn
}

node 'cirope.com', 'cirope-dev.com' inherits basenode {
  include deployer
  include unicorn
}
