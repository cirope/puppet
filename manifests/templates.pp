class baseclass {
  include vars
  include system
  include root
  include swap
  include groups
  include ssh
  include packages
  include services
  include nginx
}

node default {
  class { 'apt': }

  include baseclass
}
