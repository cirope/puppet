node racknode inherits basenode {
  include user::deployer
  include unicorn
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

node 'cirope.com' inherits racknode {
}

node 'php.com' inherits basenode {
  include php
}
