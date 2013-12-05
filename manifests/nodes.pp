node racknode inherits basenode {
  include deployer
  include unicorn
}

node 'librujo.com' inherits racknode {
  include postgresql_conf
}

node 'mawidabp.com' inherits racknode {
  include postgresql_conf
}

node 'mawidaqa.com' inherits racknode {
  include postgresql_conf
}

node 'cirope.com' inherits racknode {
}
