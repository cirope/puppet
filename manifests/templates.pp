include vars

class baseclass {
  class { 'apt': }

  include system
  include root
  include swap
  include groups
  include ssh
  include packages
  include services
  include nginx
}

node basenode {
  include baseclass
}

node default {
}
