node racknode inherits basenode {
  include user::deployer
  include unicorn
}

node 'cirope.com' inherits racknode {
}

node 'libreduca.com' inherits racknode {
  include pg
}

node 'librujo.com' inherits racknode {
  include pg
}

node 'mawidabp.com' inherits racknode {
  include pg
}

node 'mawidaqa.com' inherits racknode {
  include pg
}

node 'php.libreduca.com' inherits basenode {
  include php
}
