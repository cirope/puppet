include vars

class baseclass {
  if $::osfamily == 'debian' {
    include apt
  }

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
