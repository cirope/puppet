node racknode inherits basenode {
  include deployer
  include unicorn
}

node 'librujo.com', 'librujo-dev.com' inherits racknode {
  include postgresql_conf
}

node 'mawidabp.com', 'mawidabp-dev.com' inherits racknode {
  include postgresql_conf
}

node 'mawidaqa.com', 'mawidaqa-dev.com' inherits racknode {
  include postgresql_conf
}

node 'cirope.com', 'cirope-dev.com' inherits racknode {
}
