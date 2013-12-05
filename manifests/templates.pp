include vars

class baseclass {
  include apt
  include system
  include root
  include swap
  include groups
  include ssh
  include packages
  include services
  include nginx
  include newrelic
}

node basenode {
  include baseclass
}

node default {
}
