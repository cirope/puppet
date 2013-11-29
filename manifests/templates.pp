class baseclass {
  include vars,
    system,
    root,
    swap,
    groups,
    ssh,
    packages,
    services,
    nginx

  class { 'apt': }
}

node default {
  include baseclass
}
