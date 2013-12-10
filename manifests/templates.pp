include vars

class baseclass {
  include apt
  include system
  include swap
  include packages
  include services
  include user
  include nginx
  include newrelic
}

node basenode {
  include baseclass
}

node default {
}
